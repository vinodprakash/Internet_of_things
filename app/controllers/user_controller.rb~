class UserController < ApplicationController
  def index
    @current = User.all
      PrintWorker.perform_async(params[:username])
  
  end
end
