# == Schema Information
#
# Table name: commentvotes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Commentvote < ActiveRecord::Base
  attr_accessible :user_id, :comment_id

  belongs_to :user
  belongs_to :comment
end
