# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  belongs_to :role
  has_many :events, dependent: :destroy

  before_validation :set_role, on: %i[create update]

  before_save :ensure_authentication_token

  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  Role.find_each do |role|
    define_method "#{role.alias_name}?" do
      role_id == role.id
    end
  end

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def set_role
    self.role ||= Role.find_by(alias_name: :default_user)
  end
end
