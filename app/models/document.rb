class Document < ApplicationRecord
  mount_uploader :file, DocumentUploader
  
  validates :tracking_code, presence: true, uniqueness: true
  validates :original_filename, presence: true
  validates :file_size, presence: true, numericality: { greater_than: 0 }
  validates :mime_type, presence: true
  
  has_many :status_histories, dependent: :destroy
  
  before_create :generate_tracking_code
  after_create :create_initial_status
  
  enum status: {
    pending: 'pending',
    processing: 'processing',
    completed: 'completed',
    rejected: 'rejected',
    cancelled: 'cancelled'
  }
  
  scope :recent, -> { order(created_at: :desc) }
  
  def self.generate_tracking_code
    loop do
      code = "DH#{Time.current.to_i.to_s(36).upcase}#{SecureRandom.hex(3).upcase}"
      break code unless exists?(tracking_code: code)
    end
  end
  
  def update_status(new_status, notes = nil)
    update!(status: new_status, notes: notes)
    status_histories.create!(
      status: new_status,
      notes: notes,
      updated_at: Time.current
    )
  end
  
  def status_display
    status.humanize
  end
  
  def file_size_display
    return "0 Bytes" if file_size.zero?
    
    k = 1024
    sizes = %w[Bytes KB MB GB]
    i = Math.log(file_size) / Math.log(k)
    
    "#{format('%.2f', file_size / k**i)} #{sizes[i.floor]}"
  end
  
  private
  
  def generate_tracking_code
    self.tracking_code = self.class.generate_tracking_code
  end
  
  def create_initial_status
    status_histories.create!(
      status: 'pending',
      notes: 'Document submitted, waiting for processing',
      updated_at: created_at
    )
  end
end 