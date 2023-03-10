require 'rqrcode'

class FidelityCard < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def free_dish_remaining?
    free_dish
  end

  def new_point
    self.points += 1
    save
  end

  def new_free_dish?
    (self.points % 5).zero?
  end

  def new_free_ish
    self.free_dish_remaining += 1
    save
  end

  def use_free_dish
    self.free_dish = false
    save
  end

  def qr_code_fidelity_card
    path_to_fidelity_card = Rails.application.routes.url_helpers.fidelity_card_url(self)
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
