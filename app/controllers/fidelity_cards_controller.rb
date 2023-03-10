class FidelityCardsController < ApplicationController
  before_action :set_restaurant, only: %i[create]

  def create
    @fidelity_card = FidelityCard.new
    @fidelity_card.user = current_user
    @fidelity_card.restaurant = @restaurant

    respond_to do |format|
      if @fidelity_card.save
        format.html { redirect_to restaurant_path(@restaurant) }
        format.json
      else
        format.html { render "restaurants/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
