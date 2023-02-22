class Status < ApplicationRecord
  has_many :users, dependent: :destroy
end
