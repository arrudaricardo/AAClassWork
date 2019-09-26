class UsersController < ApplicationController
  def index
    user = User.all

    render json: user
  end

  def create
    user = User.new(user_param)
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: 422
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user.update(user_param)
      render json: user
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_param
    params.require(:user).permit(:username)
  end 
end
