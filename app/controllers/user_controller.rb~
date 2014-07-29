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
end
