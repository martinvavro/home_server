class Statistic < ApplicationRecord
  validates_uniqueness_of :date
  alias_attribute :windows, :statistics_not_home_windows
  has_many :statistics_not_home_windows
end
