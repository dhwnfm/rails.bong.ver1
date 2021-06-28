class ReservationsController < ApplicationController
  def index
   @reservations = Reservation.all
   @rooms = Room.all
  end

  def new
   @reservation = Reservation.new 
   @room = Room.new
   

  end
 
  def show
    @reservations = current_user.reservations.all
    @rooms = current_user.rooms.all #<!-この部分が気になりますが代わりの方法がありますかね。。、。。 -->
  end
  
 
 def create
   @reservation = Reservation.new(reservation_params)
   @reservation.id = current_user.id
   if @reservation.save
   flash[:notice] = "予約しました。"
   redirect_to :user_session
   else
   render "new"
   end
 end
 
 def destroy
   @reservation = Reservation.find(params[:id])
   @reservation.destroy
   flash[:notice] = "削除しました"
   redirect_to :user_session
 end

 private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people )
  end

 
end
