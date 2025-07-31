class Admin < ApplicationRecord
  has_secure_password
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  before_create :set_default_role
  
  def self.authenticate(username, password)
    admin = find_by(username: username)
    admin&.authenticate(password)
  end
  
  def generate_jwt_token
    JWT.encode(
      { id: id, username: username, exp: 24.hours.from_now.to_i },
      Rails.application.credentials.secret_key_base
    )
  end
  
  private
  
  def set_default_role
    self.role ||= 'admin'
  end
end 