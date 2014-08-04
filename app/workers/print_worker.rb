class PrintWorker
  include Sidekiq::Worker
 
  def perform(str)
   puts str 
   mobile = Mobile.find(str) 
   puts "Recieved details : #{mobile.to_json.to_s}"
   id = #{mobile.id.to_json.to_s}
   name = #{mobile.name.to_json.to_s}
   model = #{mobile.model.to_json.to_s}
   createdat = #{mobile.created_at.to_json.to_s}
   updatedat = #{mobile.updated_at.to_json.to_s}
   userid = #{mobile.user_id.to_json.to_s}
   db = Mongo::Connection.new.db('iot-sidekiq')
     coll = db.collection("mobile")
                coll.insert({:Mobile_id =>id, :Name =>name,:Model =>model, :Created_at =>createdat,:Last_Update =>updatedat, :Created_by_User =>userid})
 end
end
