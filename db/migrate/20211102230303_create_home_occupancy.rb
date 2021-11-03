class CreateHomeOccupancy < ActiveRecord::Migration[6.1]
  def change
    create_table :home_occupancies do |t|
      t.integer :devices_number
      t.boolean :is_home

      t.timestamps
    end
  end
end
