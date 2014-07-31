class UserController < ApplicationController
  def index
    @current = User.all
   # current = User.all
#   @time= logger.info("#{Time.now}")
    #PrintWorker.perform_async(params[:print])
    #PrintWorker.perform_async('vinod')
     
   # PrintWorker.perform_async(x,y,z,name,model)
 
        
  end

  def rabbitsend
   mobile = Mobile.find(params[:id])
   conn = Bunny.new
   conn.start
  
   ch   = conn.create_channel
   q    = ch.queue("#{mobile.id}")

   ch.default_exchange.publish(mobile.to_json.to_s, :routing_key => q.name)
   puts " Mobile details Sent!!'"

     end

  def rabbitrec
   mobile = Mobile.find(params[:id])
   conn = Bunny.new
   conn.start

   ch   = conn.create_channel
   q    = ch.queue("#{mobile.id}")

  begin

  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts "Received details:#{body}"
    @namedata="#{body}"
   delivery_info.consumer.cancel
  end

   end


  end
end
