class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :tel
      t.string :organ
      t.string :homepage
      t.string :type
      t.text :about

      t.timestamps
    end
  end
end
