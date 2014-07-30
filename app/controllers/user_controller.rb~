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
   mobile = Mobile.find(params[:id])
conn = Bunny.new
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

ch.default_exchange.publish(mobile.name, :routing_key => q.name)
puts " Mobile name Sent!!'"

q    = ch.queue("hello1")

ch.default_exchange.publish(mobile.model, :routing_key => q.name)
puts " Mobile model Sent!!'"

conn.close
  end

  def rabbitrec
   
conn = Bunny.new
conn.start

ch   = conn.create_channel
q    = ch.queue("hello")

begin

  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts "Received mobile Name:#{body}"
    @namedata="#{body}"
   delivery_info.consumer.cancel
  end

   end

q    = ch.queue("hello1")

begin

  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts "Received Mobile Model:#{body}"
    @modeldata="#{body}"
    
   delivery_info.consumer.cancel
  end

   end
  end
end
