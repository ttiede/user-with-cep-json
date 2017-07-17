require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validates' do
    let(:user) { build :user }
    let(:address) { build :address }

    it "hasn't address" do
      expect(user.save).not_to be
    end

    it 'with zipcode address' do
      user.address = address
      expect(user.save).to be
    end

    it 'invalid zipcode address' do
      address.zipcode = '18040011'
      user.address = address

      expect(user.save).not_to be
    end
  end
end
