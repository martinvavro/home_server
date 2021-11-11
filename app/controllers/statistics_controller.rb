class StatisticsController < ApplicationController
  def index
    @occupancies = HomeOccupancy.all
    @statistics = Statistic.all

    respond_to do |format|
      format.js { render layout: false }
      format.html { render 'index' } 
    end
  end
end
