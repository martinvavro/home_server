class CreateNetworkSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :network_settings do |t|
      t.integer :is_home_threshold
      t.boolean :alarm
      t.time :alarm_time
      t.integer :sunset_offset
    end
  end
end
