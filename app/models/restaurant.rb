class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :speciality
end