require 'rubygems'
require 'json'
require 'net/http'

class PrintWorker
  include Sidekiq::Worker
   
  def perform(str)
   puts str 
     
     conn = Bunny.new
     conn.start
     ch   = conn.create_channel
     q    = ch.queue(str)
    q.subscribe(:block => true) do |delivery_info, properties, body|
     puts " #{q.name}Received details:#{body}"
    
    

  end
 end
end
