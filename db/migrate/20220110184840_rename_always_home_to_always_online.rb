class RenameAlwaysHomeToAlwaysOnline < ActiveRecord::Migration[6.1]
  def change
    rename_column :devices, :always_home, :always_online
  end
end
