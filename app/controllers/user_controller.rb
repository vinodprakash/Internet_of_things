#require 'rubygems'
#require 'json'
#require 'net/http'

class UserController < ApplicationController
  
# respond_to :json
 # $angelURI = "http://localhost:3000/mobiles"

  def index
    @current = User.all

   #UserMailer.welcome_email(@current).deliver
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

   ch.default_exchange.publish(mobile.to_json.to_s,:routing_key => q.name)
   puts " Mobile details Sent!!'"

     end

  def rabbitrec
   mobile = Mobile.find(params[:id])
   conn = Bunny.new
   conn.start

   ch   = conn.create_channel
   q    = ch.queue("#{mobile.id}")

  q.subscribe(:block => true) do |delivery_info, properties, body|
    puts "#{q.name} Received details:#{body}"
    @namedata="#{body}"
    
   delivery_info.consumer.cancel
    end
     rescue Interrupt => _
         ch.close
         conn.close

     exit(1)


  end
end
