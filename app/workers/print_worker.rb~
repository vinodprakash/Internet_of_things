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
    
     puts "Split"
 
   #parsing Json data Using URL
 
   source = 'http://localhost:3000/mobiles/'+ "#{q.name}" +'.json'
   resp = Net::HTTP.get_response(URI.parse(source))
   data = resp.body
   result = JSON.parse(data)
   puts "Recieved Json-details : #{result}"
   

  end
 end
end
