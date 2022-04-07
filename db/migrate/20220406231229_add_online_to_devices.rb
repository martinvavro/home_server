class AddOnlineToDevices < ActiveRecord::Migration[6.1]
  def change
    add_column :devices, :online, :boolean
  end
end
