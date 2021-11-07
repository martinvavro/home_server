class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.integer :is_home_threshold
      t.boolean :alarm
      t.time :alarm_time
      t.integer :sunset_offset
      t.text :last_nmap_info
    end
  end
end
