class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id, :null => false
      t.integer :link_id, :null => false
      t.boolean :is_up, :null => false

      t.timestamps
    end
  end
end
