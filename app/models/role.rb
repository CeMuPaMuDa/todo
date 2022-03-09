# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id                                       :bigint           not null, primary key
#  alias_name(Псевдоним на рус.)            :string
#  name(Название англ: Administrator, User) :string
#  created_at                               :datetime         not null
#  updated_at                               :datetime         not null
#
class Role < ApplicationRecord
  has_many :users
  validates :name, presence: true
end
