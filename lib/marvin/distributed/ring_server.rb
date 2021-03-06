require 'rinda/ring'
require 'rinda/tuplespace'

module Marvin
  module Distributed
    class RingServer
      
      attr_accessor :tuple_space, :ring_server
      cattr_accessor :logger
      self.logger = Marvin::Logger
      
      def initialize
        self.tuple_space = Rinda::TupleSpace.new
        self.ring_server = Rinda::RingServer.new(self.tuple_space)
      end
      
      def self.run
        begin
          logger.info "Starting up DRb"
          DRb.start_service
          logger.info "Creating TupleSpace & Ring Server Instances"
          self.new
          logger.info "Started - Joining thread."
          DRb.thread.join
        rescue
          logger.fatal "Error starting ring server - please ensure another instance isn't already running."
        end
      end
      
    end
  end
end