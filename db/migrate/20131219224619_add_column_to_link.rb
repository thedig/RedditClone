class AddColumnToLink < ActiveRecord::Migration
  def change
    add_column :links, :sub_id, :integer, :null => false
  end
end
