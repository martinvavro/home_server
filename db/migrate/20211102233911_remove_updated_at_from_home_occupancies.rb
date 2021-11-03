class RemoveUpdatedAtFromHomeOccupancies < ActiveRecord::Migration[6.1]
  def change
    remove_column :home_occupancies, :updated_at, :timestamp
  end
end
