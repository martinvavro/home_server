class NetworkController < ApplicationController
  def index
    @last_entry = HomeOccupancy.last
    respond_to do |format|
      format.html
      format.text 
    end
  end
end
