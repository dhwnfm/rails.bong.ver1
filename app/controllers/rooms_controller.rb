class RoomsController < ApplicationController
  def index
   @rooms = Room.all
   
  end

  def new
   @room = Room.new  
   @room.images.build
   
  end

  def create
   
   @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :user_id, images_attributes: [:image_url]))
   @room.user_id = current_user.id
   if @room.save
   flash[:notice] = "ルームを新規登録しました"
   redirect_to :user_session
   else
   render "new"
   end
  end

  def show
   
# ===============追加==============
  
    @rooms = current_user.rooms.all
# ================================
  end
  
  def reserve
   
  end
  
  def edit
    @room = Room.find(params[:id])
    @reservation = Reservation.new
   
  end

  def update
  end
  
  def destroy
   @room = Room.find(params[:id])
   @room.destroy
   flash[:notice] = "削除しました"
   redirect_to :rooms
  end
end
