# == Schema Information
#
# Table name: ancestor_references
#
#  id            :integer          not null, primary key
#  ancestor_id   :integer
#  descendant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class AncestorReference < ActiveRecord::Base
  attr_accessible :ancestor_id, :descendant_id

  belongs_to :ancestor, class_name: "Comment"
  belongs_to :descendant, class_name: "Comment"
end
