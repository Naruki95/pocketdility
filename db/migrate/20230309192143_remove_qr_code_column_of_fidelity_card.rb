class RemoveQrCodeColumnOfFidelityCard < ActiveRecord::Migration[7.0]
  def change
    remove_column :fidelity_cards, :qr_code, :string
  end
end
