class CreateEventAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :event_attachments do |t|
      t.string :attachment
      t.string :description
      t.integer :event_id

      t.timestamps
    end
    add_index :event_attachments, :event_id
  end
end
