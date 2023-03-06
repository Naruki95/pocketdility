class CreateFidelityCards < ActiveRecord::Migration[7.0]
  def change
    create_table :fidelity_cards do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.integer :points, default: 0
      t.boolean :free_dish, default: false
      t.string :qr_code

      t.timestamps
    end
  end
end
