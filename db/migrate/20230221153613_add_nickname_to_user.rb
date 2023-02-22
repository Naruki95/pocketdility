class AddNicknameToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :status, foreign_key: true
    add_column :users, :username, :string, null: false
  end
end
