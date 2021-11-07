class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :ip
      t.string :mac
      t.boolean :personal
    end
  end
end
