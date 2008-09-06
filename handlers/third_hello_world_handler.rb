class ThirdHelloWorldHandler < Marvin::CommandHandler
  
  self.command_prefix = "!"
  
  exposes :hello
  
  def hello(data)
    logger.debug data.inspect
    reply "Hello!"
  end
  
end