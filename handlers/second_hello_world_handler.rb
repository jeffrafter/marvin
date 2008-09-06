class SecondHelloWorldHandler < Marvin::Base
  
  on_event :incoming_message do
    reply "hello!" if options.message =~ /hello/i
  end
  
end