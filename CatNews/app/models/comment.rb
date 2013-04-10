# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  body        :string(255)
#  user_id     :integer
#  ancestor_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :post_id, :body, :user_id, :parent_id

  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: "Comment" # the one ancestor above this one

  has_many :ancestor_joins, class_name: "AncestorReference", :foreign_key => "descendant_id"
  # SELECT * FROM ancestor_references a
  # JOIN ancestor_references b
  # ON a.descendant_id == b.descendant_id #get every comment that has a related
  # WHERE a.descendant_id == ?
  #  descendant


  has_many :descendant_joins, class_name: "AncestorReference", :foreign_key => "ancestor_id"

  has_many :ancestors, through: :ancestor_joins
  has_many :descendants, through: :descendant_joins

  before_create :add_ancestors

  def add_ancestors #rev: cool!
    unless parent.nil?
      ancestors << parent
      parent.ancestors.each do |ancestor|
        ancestors << ancestor
      end
    end
  end

end
