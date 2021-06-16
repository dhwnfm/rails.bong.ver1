class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(current_user.id)
    @rooms = @user.rooms  
  end
end
