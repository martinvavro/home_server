class StatisticsController < ApplicationController
  def index
    @occupancies = HomeOccupancy.all
  end
end
