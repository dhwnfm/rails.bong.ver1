class ReservationsController < ApplicationController
  def index
   @reservations = current_user.reservations.all
   
  end

  def new
   @reservation = Reservation.new  
   
  end
 
 
 def create
  @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :user_id, :room_id ))
   @reservation.user_id = current_user.id

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

end
