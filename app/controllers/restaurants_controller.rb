class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_restaurant, only: %i[show edit destroy]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @fidelity_card = FidelityCard.new
  end

  def destroy

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :telephone_number, :website_url, :user_id, :speciality_id)
  end
end
