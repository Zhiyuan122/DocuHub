class DocumentsController < ApplicationController
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
end 