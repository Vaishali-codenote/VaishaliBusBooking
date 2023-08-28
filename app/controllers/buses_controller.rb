class BusesController < ApplicationController
 include Searchable
  
  def index
    @route = Route.find(params[:route_id])
    @buses = @route.buses.all
  end

  def all_buses
    @buses = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      flash[:alert] = "Bus Added successfully"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    if @bus.update(bus_params)
      flash[:alert] = "Bus updated"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    Bus.find(params[:id]).destroy
    flash[:alert] = "Bus deleted"
    redirect_to request.referrer
  end

  def search
    @my_data = searched
  end
  
  def city_suggestions
    term = params[:term]
    cities = City.where('name ILIKE ?', "%#{term}%").pluck(:name)
    render json: cities
  end
  
  def autocomplete
    query = params[:term] # The search query sent by autocomplete
    suggestions = City.where('name LIKE ?', "%#{query}%").pluck(:name)
    render json: suggestions
  end

  private

  def bus_params
    params.require(:bus).permit(:starting_city, :destination_city, :name, :number, :bustype, :price, :seats, :drop, :pickup, :departure_time, :arrival_time)
  end
end
