class ChangeCommentIdToAncestorIdInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :comment_id, :ancestor_id
  end
end
