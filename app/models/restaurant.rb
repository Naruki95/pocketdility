class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :speciality

  def qr_code_to_new_fidelity_card
    path_to_new_fidelity_card = Rails.application.routes.url_helpers.new_restaurant_fidelity_card_path(self)
    RQRCode::QRCode.new(path_to_new_fidelity_card)
                   .as_svg(
                     color: "000",
                     shape_rendering: "crispEdges",
                     module_size: 5,
                     standalone: true,
                     use_path: true
                   )
  end
end
