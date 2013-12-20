class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, :null => false
      t.integer :link_id, :null => false
      t.integer :parent_id

      t.timestamps
    end
  end
end
