class TripsController < ApplicationController
  before_action :set_trip, except: [:index, :new, :create]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:title, :month, :year)
    end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
