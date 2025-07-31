class Api::Admin::DocumentsController < ApplicationController
  before_action :authenticate_admin!
  skip_before_action :verify_authenticity_token
  
  def index
    @documents = Document.recent
    render json: @documents
  end
  
  def update_status
    @document = Document.find(params[:id])
    
    if @document.update_status(params[:status], params[:notes])
      render json: { success: true, message: 'Status updated successfully' }
    else
      render json: { error: 'Failed to update status' }, status: :unprocessable_entity
    end
  end
  
  private
  
  def authenticate_admin!
    token = request.headers['Authorization']&.split(' ')&.last
    
    if token
      begin
        decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })
        @current_admin = Admin.find(decoded_token[0]['id'])
      rescue JWT::DecodeError, ActiveRecord::RecordNotFound
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Missing token' }, status: :unauthorized
    end
  end
end 