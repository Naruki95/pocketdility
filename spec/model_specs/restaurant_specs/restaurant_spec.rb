require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'restaurant should have validations' do
    let(:valid_user) { User.create(email: 'test@test.com', password: 'testtest', username: 'tester_4') }
    let(:speciality) { Speciality.create(title: 'USA') }

    it 'and should not be valid without user' do
      restaurant = Restaurant.new(
        name: "McD", address: "123 fake street", description: "Burgers",
        telephone_number: "1231231233", website_url: "none",
        speciality: speciality
      )
      expect(restaurant.valid?).to eq false
    end

    it 'and should not be valid without a name' do
      restaurant_1 = Restaurant.new(
        address: "321 fake street", description: "Burgers",
        telephone_number: "1231231233", website_url: "none", user: valid_user,
        speciality: speciality
      )
      expect(restaurant_1.valid?).to eq false
    end

    it 'and should not be valid without an address' do
      restaurant_2 = Restaurant.new(
        name: "Burger king", description: "Burgers",
        telephone_number: "1231231233", website_url: "none", user: valid_user,
        speciality: speciality
      )
      expect(restaurant_2.valid?).to eq false
    end

    it 'and should not be valid without user' do
      restaurant = Restaurant.new(
        name: "Quick", address: "321 fake street", description: "Burgers",
        telephone_number: "1231231233", website_url: "none",
        speciality: speciality
      )
      expect(restaurant.valid?).to eq false
    end

    it 'and should be valid with name, address, speciality and user' do
      restaurant_4 = Restaurant.new(
        name: "Ace of Fallafel", address: "321 fake street", user: valid_user,
        speciality: speciality
      )
      expect(restaurant_4.valid?).to eq true
    end
  end
end
