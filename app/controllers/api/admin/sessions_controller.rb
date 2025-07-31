class Api::Admin::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    admin = Admin.authenticate(params[:username], params[:password])
    
    if admin
      token = admin.generate_jwt_token
      render json: { success: true, token: token }
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
end 