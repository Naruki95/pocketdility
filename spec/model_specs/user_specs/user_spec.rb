require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user should have the correct information' do
    let(:valid_user) { User.create(email: 'test@test.com', password: 'testtest', username: 'tester', status: Status.new(title: "restaurateur")) }

    it 'and should have an associated email' do
      expect(valid_user.email).to eq 'test@test.com'
    end

    it 'and must have unique usernames' do
      second_user = User.create(email: 'test_2@test.com', password: 'testtest1234', username: 'tester')
      expect(second_user.valid?).to eq false
    end

    it 'and must not be valid without a status' do
      statusless_user = User.new(
        email: 'testing@testing.com',
        password: 'testtest',
        username: 'test_is_nice',
      )
      expect(statusless_user.valid?).to eq false
    end
  end
end
