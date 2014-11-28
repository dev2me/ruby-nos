require "ruby_nos/version"

module RubyNos
  autoload :Agent,            "ruby_nos/agent"
  autoload :Cloud,            "ruby_nos/cloud"
  autoload :Initializable,    "initializable"
  autoload :Message,          "ruby_nos/message"
  autoload :Processor,        "ruby_nos/processor"
  autoload :UDPReceptor,      "ruby_nos/udp_receptor"
  autoload :UDPSender,        "ruby_nos/udp_sender"
  autoload :VERSION,          "ruby_nos/version"
end
