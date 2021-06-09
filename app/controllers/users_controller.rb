class UsersController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
  end
  
  def new
    @user = User.find(current_user.id)
    @room = Room.new
  end  
  
  def show
    @user = User.find(current_user.id)
     
  end
end
