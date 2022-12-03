class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { minimun: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: { minimun: 5, maximum: 255 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, length: { minimum: 8 }
end
