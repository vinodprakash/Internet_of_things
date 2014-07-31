class PrintWorker
  include Sidekiq::Worker
 
  def perform(str,mobile)
   puts str 
   mobile = Mobile.find(str) 
   puts "Recieved details : #{mobile.to_json.to_s}"
  
   db = Mongo::Connection.new.db('iot-side')
      coll = db.collection("mobile")
                  coll.insert({:Id =>str})

 end
end
