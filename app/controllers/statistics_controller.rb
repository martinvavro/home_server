class StatisticsController < ApplicationController
  def index
    @occupancies = HomeOccupancy.all
    @statistics = Statistic.all
  end
end
