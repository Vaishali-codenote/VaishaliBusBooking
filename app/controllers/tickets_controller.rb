class TicketsController < ApplicationController
	before_action :authenticate_user!
  
  def index
     @tickets=Ticket.all
  end

  def new
   @bus = Bus.find_by(id: params[:bus_id])
    @wallet=current_user.wallet
    @ticket =Ticket.new
  end

  def create
    bus = Bus.find_by(id: params[:ticket][:bus_id])
    if bus.nil?
     flash[:notice] = "Bus Not Available"
    else
      seats = bus.total_seats
      if seats < params[:ticket][:seat_booked].to_i
        flash[:alert] = "Seats Not Available"
      else
        @ticket = Ticket.new(ticket_params)
        @ticket.user_id=current_user.id
        @ticket.tot_amount=params[:tot_amount]
        @ticket.date=params[:ticket][:date]
          if @ticket.save
            bus.update(available_seats: seats - params[:ticket][:seat_booked].to_i)
            redirect_to tickets_path(@ticket)
            TicketCreateJob.perform_later(@ticket)
          else
            flash[:notice] = "Booking Failed"
          end
      end
    end
  end


 def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:alert] = "detaills updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:alert] = "Ticket deleted"
    redirect_to request.referrer
  end

  private

  def ticket_params
    
    params.require(:ticket).permit(:name, :age, :sex,:seat_booked,:bus_id, :price)
  end
end


