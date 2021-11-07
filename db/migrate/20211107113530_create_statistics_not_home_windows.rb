class CreateStatisticsNotHomeWindows < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics_not_home_windows do |t|
      t.datetime :from
      t.datetime :to
      t.references :statistic, null: false, foreign_key: true
    end
  end
end
