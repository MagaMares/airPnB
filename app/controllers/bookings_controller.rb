class BookingsController < ApplicationController
  before_action :find_planet, only: %i[index new create show edit]

  def new
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @booking.planet = @planet
    @booking.user = @user
    if @booking.save
      redirect_to dashboard_path(@dashboard)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @booking = Booking.all
    @user = current_user
  end

  def show
    @booking = Booking.find(params(@planet))
    @user = current_user
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @user = current_user
    @booking.planet = @planet
    @booking.user = @user
    if @booking.save
      redirect_to planet_path(@planet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def find_planet
    @planet = Planet.find(params[:planet_id])
  end

  def booking_params
    params.require(:booking).permit(:rental_start, :rental_end, :planet_id)
  end
end
