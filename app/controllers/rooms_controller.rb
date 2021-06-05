class RoomsController < ApplicationController
  def index
   @rooms =  Room.all
  end

  def new
   @room = Room.new  
   @room.images.build
  end

  def create
   @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, images_attributes: [:image_url]))
   if @room.save
   flash[:notice] = "ルームを新規登録しました"
   redirect_to :rooms
   else
   render "new"
   end
  end

  def show
  end

  def edit
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
