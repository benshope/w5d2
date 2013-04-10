# == Schema Information
#
# Table name: postvotes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Postvote < ActiveRecord::Base
  attr_accessible :user_id, :post_id
  validates :user_id, uniqueness: { scope: :post_id } #rev: nice
  belongs_to :user
  belongs_to :post

  # before this saves, make sure user+post are unique
end
