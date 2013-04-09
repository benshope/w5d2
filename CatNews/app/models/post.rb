# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  link       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :link, :user_id, :comments_attributes

  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :comments
end
