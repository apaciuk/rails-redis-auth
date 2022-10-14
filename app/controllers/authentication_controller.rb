# frozen_string_literal: true

class AuthenticationController < ApplicationController
  respond_to? :json

  def authenticate
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      token = session.id
      render json: { token: token, user: user }
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
