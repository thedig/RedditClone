class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, :null => false
      t.string :url, :null => false
      t.text :body, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
