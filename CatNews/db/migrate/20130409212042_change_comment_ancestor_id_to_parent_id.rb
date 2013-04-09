class ChangeCommentAncestorIdToParentId < ActiveRecord::Migration
  def change
    rename_column :comments, :ancestor_id, :parent_id
  end
end
