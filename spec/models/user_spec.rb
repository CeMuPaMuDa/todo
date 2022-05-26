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
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    Role.create(name: 'Пользователь', alias_name: :default_user)
  end

  let(:user) { User.new(name: FFaker::Internet.user_name[0...16]) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end
  it 'is not valid with too short name' do
    expect(User.new(name: 'a')).to_not be_valid
  end

  it 'is not valid with too long name' do
    expect(User.new(name: 'a' * 17)).to_not be_valid
  end
end
