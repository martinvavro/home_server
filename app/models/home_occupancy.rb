class HomeOccupancy < ApplicationRecord
  scope :yesterday_records, -> { where(created_at: 1.day.ago.all_day) }
end
