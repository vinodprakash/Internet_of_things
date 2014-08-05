require 'rubygems'
require 'json'
require 'net/http'

class PrintWorker
  include Sidekiq::Worker
   
  def perform(str)
   puts str 
   #response ="http://localhost:3000/mobiles.json"
#  mobile = Mobile.find(str) 
  # mobile =  JSON.parse(response)

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
 

 end
end
