class PrintWorker
  include Sidekiq::Worker
 
  def perform(str,mobile)
   puts str 
   mobile = Mobile.find(str) 
   puts "Recieved details : #{mobile.to_json.to_s}"
   name = "#{mobile.name}"
   model = "#{mobile.model}"  
   db = Mongo::Connection.new.db('iot-side')
     coll = db.collection("mobile")
                coll.insert({:Name =>name, :Model =>model})
 


 end
end
