require "spec_helper"
require 'ipaddr'
require 'json'

describe RubyNos::UDPSender do

  subject{UDPSender.new}

  describe "#send" do
    let(:message) {{message: Message.new.serialize}}

    context "multicast address by default" do
      let(:host)      {"230.31.32.33"}
      let(:bind_addr) {"0.0.0.0"}
      let(:port)      {3784}
      let(:socketrx)  {UDPSocket.new}

      before(:each) do
        membership = IPAddr.new(host).hton + IPAddr.new(bind_addr).hton
        socketrx.setsockopt(:IPPROTO_IP, :IP_ADD_MEMBERSHIP, membership)
        socketrx.bind(bind_addr, port)
      end

      after(:each) do
        socketrx.close
      end

      it "sends to group address by default" do
        subject.send(message)
        expect(socketrx.recvfrom(512).first). to eq(message[:message].to_json)
        sleep 0.2
      end
    end
  end
end