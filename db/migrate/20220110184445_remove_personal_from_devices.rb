class RemovePersonalFromDevices < ActiveRecord::Migration[6.1]
  def change
    remove_column :devices, :personal, :boolean
  end
end
