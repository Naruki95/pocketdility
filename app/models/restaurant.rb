class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :speciality

  def qr_code
    path_to_self = Rails.application.routes.url_helpers.restaurant_path(self)
    RQRCode::QRCode.new(path_to_self)
                   .as_svg(
                     color: "000",
                     shape_rendering: "crispEdges",
                     module_size: 5,
                     standalone: true,
                     use_path: true
                   )
  end
end
