class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.date :date
      t.integer :home
      t.integer :not_home
    end
  end
end
