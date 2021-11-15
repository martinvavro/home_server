class AddAlwaysHomeToDevices < ActiveRecord::Migration[6.1]
  def change
    add_column :devices, :always_home, :boolean
  end
end
