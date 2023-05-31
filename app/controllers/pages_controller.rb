class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  def home
  end
  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @booked_planets = @user.rented_planets
  end
end
