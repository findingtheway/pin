class AddUserIdToDots < ActiveRecord::Migration
  def change
    add_column :dots, :user_id, :integer
    add_index :dots, :user_id
  end
end
