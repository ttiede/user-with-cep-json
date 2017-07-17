module V1
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show update destroy]

    # GET /users
    def index
      @users = User.last(5)

      render json: @users, include: [:address], exception: %i[updated_at created_at]
    end

    # GET /users/1
    def show
      render json: @user, include: [:address], exception: %i[updated_at created_at]
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, include: [:address], exception: %i[updated_at created_at], status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user, include: [:address], exception: %i[updated_at created_at]
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      if @user.destroy
        render json: { payload: 'User has deleted' }
      else
        render json: { payload: "User with ID = #{@user.id} hasn't deleted" }, status: :unprocessable_entity
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :name, :email,
        address_attributes: [:zipcode]
      )
    end
  end
end
