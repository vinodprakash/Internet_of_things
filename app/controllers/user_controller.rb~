class UserController < ApplicationController
  def index
    @current = User.all
    current = User.all
    #PrintWorker.perform_async(params[:print])
    #PrintWorker.perform_async('vinod')
    x = [] 
    y = []
    z = []
    current.each do |job|
    		x << job["email"]
    		y << job["sign_in_count"]
                z << job["username"]
		  end
      mobile = Mobile.all
   
    name = []
    model = []
    mobile.each do |job|
    		
    		name << job["name"]
                model << job["model"]
		  end
   
    PrintWorker.perform_async(x,y,z,name,model)
 
        
  end

  def rabbitsend
   
conn = Bunny.new
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

ch.default_exchange.publish("Hello World!", :routing_key => q.name)
puts " [x] Sent 'Hello World!'"

conn.close
  end

  def rabbitrec
   
conn = Bunny.new
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

begin
  puts " [*] Waiting for messages. To exit press CTRL+C"
  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] Received #{body}"
   delivery_info.consumer.cancel
  end

   end
  end
end
