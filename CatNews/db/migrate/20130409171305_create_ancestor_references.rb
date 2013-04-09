class CreateAncestorReferences < ActiveRecord::Migration
  def change
    create_table :ancestor_references do |t|
      t.references :ancestor
      t.references :descendant

      t.timestamps
    end
    add_index :ancestor_references, :ancestor_id
    add_index :ancestor_references, :descendant_id
  end
end
