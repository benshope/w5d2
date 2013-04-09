# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  password       :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  karma          :integer
#  remember_token :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :password, :emails_attributes, :karma

  has_many :emails
  has_many :posts
  has_many :comments
  accepts_nested_attributes_for :emails
end
