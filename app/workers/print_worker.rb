require 'rubygems'
require 'json'
require 'net/http'

class PrintWorker
  include Sidekiq::Worker
   
  def perform(str)
   puts str 
     
     source = 'http://localhost:3000/mobiles/'+ str +'.json'
     resp = Net::HTTP.get_response(URI.parse(source))
     data = resp.body
     result = JSON.parse(data)
     puts "Recieved Json-details : #{result}"

#     mobile = Mobile.find(params[:id])
#     puts "#{mobile.id}"
     conn = Bunny.new
     conn.start
     id=result["id"]  
     ch   = conn.create_channel
     q    = ch.queue(str)
    puts "hello"
    q.subscribe(:block => true) do |delivery_info, properties, body|
     puts "Hello" 
     puts "Received details:#{body}"
end

=begin      @namedata="#{body}"
     delivery_info.consumer.cancel
      end
      # rescue Interrupt => _
      #     conn.close
  
    #  exit(1)

=begin
 
   #parsing Json data Using URL
 
   source = 'http://localhost:3000/mobiles/'+ str +'.json'
   resp = Net::HTTP.get_response(URI.parse(source))
   data = resp.body
   result = JSON.parse(data)
   puts "Recieved Json-details : #{result}"
   id=result["id"]
   name = result["name"]
   model = result["model"]
   createdat =result["created_at"]
   updatedat =result["updated_at"]
   userid = result["user_id"]
   puts name
   db = Mongo::Connection.new.db('iot-sidekiq')
     coll = db.collection("mobile")
                coll.insert({:Mobile_id =>id, :Name =>name,:Model =>model, :Created_at =>createdat,:Last_Update =>updatedat, :Created_by_User =>userid})
=end

 end
end
