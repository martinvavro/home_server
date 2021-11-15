class DevicesController < ApplicationController
  before_action :find_settings, only: %i[edit update destroy]

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(devices_params)

    if @device.save
      redirect_to devices_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @device.update(devices_params)
      redirect_to devices_path
    else
      render :edit
    end
  end

  def destroy
    @device.destroy

    redirect_to devices_path
  end

  private

  def find_settings
    @device = Device.find(params[:id])
  end

  def devices_params
    params.require(:device).permit(:name, :ip, :mac, :personal, :always_home)
  end
end
