class Speciality < ApplicationRecord
  has_many :restaurants, dependent: :destroy
end
