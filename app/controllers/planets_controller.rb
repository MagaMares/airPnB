class PlanetsController < ApplicationController
  def new
    @user = current_user
    @planet = Planet.new
  end

  def index
    @user = current_user
    @users = User.all
    if params[:query].present?
      @planets = Planet.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @planets = Planet.all
    end
  end

  def show
    @planet = Planet.find(params[:id])
    @booking = Booking.new
  end

  def create
    @planet = Planet.new(planet_params)
    @user = current_user
    @planet.user = @user
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render :new
    end
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    @planet = Planet.find(params[:id])
    @planet.update(planet_params)
    redirect_to planet_path(@planet)
  end

  def destroy
    @planet = Planet.find(params[:id])
    @planet.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :description, :address, :planet_type, :price, :photo)
  end
end
