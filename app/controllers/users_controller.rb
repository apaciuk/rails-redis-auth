# frozen_string_literal: true

class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_user, only: %i[show update destroy]
  respond_to? :json

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.permit(:name, :username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
