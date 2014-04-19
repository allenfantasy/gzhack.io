class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.string :url
      t.string :team
      t.text :description

      t.timestamps
    end
  end
end
