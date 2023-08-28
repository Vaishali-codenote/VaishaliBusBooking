module Searchable
  extend ActiveSupport::Concern
  
  def searched
    buses = Bus.where(starting_city: params[:from], destination_city: params[:to])
    booking_date = params[:date]
    data = {
      buses: buses,
      booking_date: booking_date
    }
    return data
  end 
end
