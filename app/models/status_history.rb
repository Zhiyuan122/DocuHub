class StatusHistory < ApplicationRecord
  belongs_to :document
  
  validates :status, presence: true
  validates :updated_at, presence: true
  
  enum status: {
    pending: 'pending',
    processing: 'processing',
    completed: 'completed',
    rejected: 'rejected',
    cancelled: 'cancelled'
  }
  
  scope :recent, -> { order(updated_at: :desc) }
  
  def status_display
    status.humanize
  end
end 