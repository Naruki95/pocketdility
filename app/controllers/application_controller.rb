class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :status_id])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :status_id])
  end

  def after_sign_in_path_for(resource)
    previous_url = URI(request.referer).path.split('/')
    if previous_url.include?('restaurants')
      create_fidelity_card(resource, Restaurant.find(previous_url.last.to_i))
      restaurant_path(previous_url.last.to_i)
    else
      dashboard_index_path
    end
  end

  private

  def create_fidelity_card(user, restaurant)
    FidelityCard.create!(user:, restaurant:)
  end
end
