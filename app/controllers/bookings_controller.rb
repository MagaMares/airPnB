class BookingsController < ApplicationController
  before_action :find_planet, only: %i[new create]

  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.planet = @planet
    if @booking.save
      redirect_to planet_path(@planet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_planet
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params.require(:booking).permit(:rental_start, :rental_end, :planet_id)
  end
end
