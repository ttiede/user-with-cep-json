require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      User.destroy_all

      @user = User.new(name: 'Name', email: 'email@email.com')
      @user.address = Address.new(zipcode: '18035520')

      @user.save
    end

    it 'sends a list of messages' do
      get :index

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.length).to eq(1)
    end
  end

  describe "POST 'create'" do
    it 'should be successful' do
      request.env['HTTP_ACCEPT'] = 'application/json'
      post :create, params: { user: { name: 'name', email: 'email@mail.com', address_attributes: { zipcode: '18035520' } } }
      response.should be_success
    end

    it "shouldn't be successful invalid zipcode" do
      request.env['HTTP_ACCEPT'] = 'application/json'
      post :create, params: { user: { name: 'name', email: 'email@mail.com', address_attributes: { zipcode: '18040010' } } }
      expect { raise StandardError }.to raise_error
    end

    it "shouldn't be successful zipcode is nil" do
      request.env['HTTP_ACCEPT'] = 'application/json'
      post :create, params: { user: { name: 'name', email: 'email@mail.com', address_attributes: {} } }
      expect { raise StandardError }.to raise_error
    end

    it "shouldn't be successful invalid email" do
      request.env['HTTP_ACCEPT'] = 'application/json'
      post :create, params: { user: { name: 'name', email: 'email', address_attributes: {} } }
      expect { raise StandardError }.to raise_error
    end
  end

  describe "PUT 'update'" do
    it 'should be successful' do
      request.env['HTTP_ACCEPT'] = 'application/json'
      post :update, params: { id: User.last.id, user: { id: User.last.id, name: 'name', email: 'email@mail.com', address_attributes: { id: User.last.address.id, zipcode: '18040010' } } }
      response.should be_success
    end

    it 'shouldn\'t be successful' do
      request.env['HTTP_ACCEPT'] = 'application/json'
      post :update, params: { id: User.last.id, user: { id: User.last.id, name: 'name', email: 'email@mail.com', address_attributes: { id: User.last.address.id, zipcode: '18040011' } } }
      expect { raise StandardError }.to raise_error
    end
  end

  describe "DELETE 'delete'" do
    it 'should be successful' do
      request.env['HTTP_ACCEPT'] = 'application/json'
      post :destroy, params: { id: User.last.id }
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it 'should be successful' do
      request.env['HTTP_ACCEPT'] = 'application/json'
      get :show, params: { id: User.last.id }
      response.should be_success
    end

    it 'should be successful' do
      request.env['HTTP_ACCEPT'] = 'application/json'
      get :show, params: { id: User.last.id }
      response.should be_success
      user = JSON.parse(response.body)
      user['name'] == 'name'
    end
  end
end
