class RemoveUserFiles < ActiveRecord::Migration
  def change
    drop_table :user_files
  end
end
