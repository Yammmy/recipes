class AddTokenToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :token, :string
    add_index :events, :token, :unique => true

    Event.find_each do |e|
      e.update( :token => SecureRandom.uuid )
    end
  end
end
