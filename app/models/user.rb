class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
