class CreateRegistrationImports < ActiveRecord::Migration[5.0]
  def change
    create_table :registration_imports do |t|
      t.string :status
      t.string :csv_file
      t.integer :event_id
      t.integer :user_id
      t.integer :total_count
      t.integer :success_count
      t.text :error_messages

      t.timestamps
    end
    add_index :registration_imports, :event_id
  end
end
