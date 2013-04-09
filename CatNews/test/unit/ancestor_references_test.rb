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

require 'test_helper'

class AncestorReferencesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
