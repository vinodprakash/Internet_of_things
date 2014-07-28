class DbController < ApplicationController
   
 def list
  unless @mobile = Mobile.find(params[:id])
  flash[:alert] = 'Mobilenot found.'
        end
   end

  def db
   @dbdata =Mobile.all
  end
 end
