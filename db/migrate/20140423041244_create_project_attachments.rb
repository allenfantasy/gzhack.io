class CreateProjectAttachments < ActiveRecord::Migration
  def change
    create_table :project_attachments do |t|
      t.string :file
      t.integer :project_id

      t.timestamps
    end
  end
end
