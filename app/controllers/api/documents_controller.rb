class Api::DocumentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    @document = Document.new(document_params)
    
    if @document.save
      render json: {
        success: true,
        tracking_code: @document.tracking_code,
        message: 'Document submitted successfully! Please save your tracking code to check status later.'
      }, status: :created
    else
      render json: {
        success: false,
        errors: @document.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
  
  def show
    @document = Document.find_by(tracking_code: params[:id])
    
    if @document
      render json: {
        document: {
          tracking_code: @document.tracking_code,
          original_filename: @document.original_filename,
          status: @document.status,
          submitted_at: @document.created_at,
          updated_at: @document.updated_at,
          notes: @document.notes
        },
        history: @document.status_histories.recent
      }
    else
      render json: { error: 'Document not found for this tracking code' }, status: :not_found
    end
  end
  
  def track
    @document = Document.find_by(tracking_code: params[:tracking_code])
    
    if @document
      render json: {
        document: {
          tracking_code: @document.tracking_code,
          original_filename: @document.original_filename,
          status: @document.status,
          submitted_at: @document.created_at,
          updated_at: @document.updated_at,
          notes: @document.notes
        },
        history: @document.status_histories.recent
      }
    else
      render json: { error: 'Document not found for this tracking code' }, status: :not_found
    end
  end
  
  private
  
  def document_params
    params.require(:document).permit(:file, :notes).tap do |permitted_params|
      if params[:document][:file].present?
        permitted_params[:original_filename] = params[:document][:file].original_filename
        permitted_params[:file_size] = params[:document][:file].size
        permitted_params[:mime_type] = params[:document][:file].content_type
      end
    end
  end
end 