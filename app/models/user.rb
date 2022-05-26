# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  active                 :boolean          default(TRUE)
#  authentication_token   :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
class User < ApplicationRecord
  # include Rolable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  belongs_to :role
  has_many :events, dependent: :destroy
  has_many :items, through: :events

  before_validation :set_role, on: %i[create update]
  before_validation :normalize_name, on: :create
  before_validation :normalize_email, if: proc { |u| u.email.present? }

  before_save :ensure_authentication_token

  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # act_as_rolable
  # Role.find_each do |role|
  #   define_method "#{role.alias_name}?" do
  #     role_id == role.id
  #   end
  # end

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

  def normalize_email
    self.email = email&.downcase
  end

  def normalize_name
    self.name = name&.downcase&.titleize
  end

  def set_role
    self.role ||= Role.find_by(alias_name: :default_user)
  end
end
