class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
    add_index :tickets, :event_id
  end
end
