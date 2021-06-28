class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
  end
  
  def new 
    @user = User.new
   
  end
  
  def create
   @user = User.new(params.require(:user).permit(:name, :introduce, :image ))
   if @user.save
   flash[:notice] = "プロフィールを編集しました"
   redirect_to :user_session
   else
   render "new"
   end
  end
  
  def show
    @user = User.find(current_user.id)
    
  end
  
  def profile
    
  end  
  
end
