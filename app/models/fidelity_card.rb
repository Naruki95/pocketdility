require 'rqrcode'

class FidelityCard < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  after_create :qr_code

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

  def new_free_dish
    self.free_dish_remaining += 1
    save
  end

  def use_free_dish
    self.free_dish = false
    save
  end

  def qr_code
    qr = RQRCode::QRCode.new("http://localhost:3000/fidelities/#{id}/")
    self.qr_code = qr.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true
    )
    save
  end
end
