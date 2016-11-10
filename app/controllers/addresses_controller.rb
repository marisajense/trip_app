class AddressesController < ApplicationController
  before_action :set_location, except: [:create, :edit, :update]
  before_action :set_address, except: [:index, :new, :create]


  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new(location: @location)
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to address_path(@address, location_id: @address.location.id)
    else
      render :new
    end
  end

  def edit
    @location = @address.location
  end

  def update
    if @address.update(address_params)
      @location = @address.location
      redirect_to address_path(location_id: @location.id)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to trip_location_path(@location.trip, @location)
  end

  private
  def address_params
    params.require(:address).permit(:country, :city,
                                      :state, :location_id)
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = Address.find_by(id: params[:id])
  end

end
