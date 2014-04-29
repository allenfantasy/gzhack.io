class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :tel
      t.string :email
      t.string :role
      t.text :intention
      t.integer :project_id

      t.timestamps
    end
  end
end
