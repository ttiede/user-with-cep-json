require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validates' do
    let(:address) { build :address }

    it "hasn't zipcode" do
      address.zipcode = nil
      expect(address.save).not_to be
    end

    it 'zipcode correct' do
      address.zipcode = '18035520'
      expect(address.save).not_to be
    end

    it 'zipcode correct' do
      @user = User.new(name: 'Name', email: 'email@email.com')
      @user.address = Address.new(zipcode: '18035520')

      @user.save

      expect(@user.address.address).not_to be_nil
      expect(@user.address.city).not_to be_nil
      expect(@user.address.zipcode).not_to be_nil
      expect(@user.address.neighborhood).not_to be_nil
      expect(@user.address.state).not_to be_nil
    end

    it 'invalid zipcode address' do
      address.zipcode = '18040011'
      expect(address.save).not_to be
    end
  end
end
