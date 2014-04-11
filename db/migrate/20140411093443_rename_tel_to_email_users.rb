class RenameTelToEmailUsers < ActiveRecord::Migration
  def change
    rename_column :users, :tel, :email
  end
end
