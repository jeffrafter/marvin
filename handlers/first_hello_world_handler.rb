class FirstHelloWorldHandler
  
  attr_accessor :client
  
  def handle_incoming_message(options)
    client.msg options[:target], "hello there!" if options[:message] =~ /hello/
  end
  
end