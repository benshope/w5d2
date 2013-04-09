# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Email < ActiveRecord::Base
  attr_accessible :address, :user_id

  belongs_to :user
end
