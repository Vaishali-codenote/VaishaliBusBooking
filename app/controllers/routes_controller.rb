class RoutesController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_id_for_all,only: %i[show edit update destroy]
  
  def index
    @routes= Route.all
  end
  def show
  end

  def new
  @route = Route.new
  end

  def create
    @route =Route.new(route_params)
    if @route.save
      flash[:alert] ="successfully created"
      redirect_to @route
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to @route
      flash[:alert] ="successfully updated"
      redirect_to @route
    else
      render :edit
    end  
  end
  

  def destroy
    @route.destroy
    flash[:alert] ="successfully updated"
    redirect_to @route
  end
  
  
  private
    def set_id_for_all
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(:from,:to)
    end
end
   



   