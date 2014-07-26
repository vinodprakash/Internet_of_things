class UserController < ApplicationController
  def index
    @current = User.all
  end
end
