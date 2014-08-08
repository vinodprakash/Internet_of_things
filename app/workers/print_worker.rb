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
    
   str="#{body}"
   result=JSON.parse(str)
   id=result["id"]
    name = result["name"]
    model = result["model"]
    createdat =result["created_at"]
    updatedat =result["updated_at"]
    userid = result["user_id"]
    
    db = Mongo::Connection.new.db('iot-sidekiq')
      coll = db.collection("mobile")
                 coll.insert({:Mobile_id =>id, :Name =>name,:Model =>model, :Created_at =>createdat,:Last_Update =>updatedat, :Created_by_User     =>userid})

   #parsing Json data Using URL
=begin 
   source = 'http://localhost:3000/mobiles/'+ "#{q.name}" +'.json'
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
   
   db = Mongo::Connection.new.db('iot-sidekiq')
     coll = db.collection("mobile")
                coll.insert({:Mobile_id =>id, :Name =>name,:Model =>model, :Created_at =>createdat,:Last_Update =>updatedat, :Created_by_User =>userid})

      delivery_info.consumer.cancel
=end
  end
 end
end
