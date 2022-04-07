class DevicesController < ApplicationController
  before_action :find_device, only: %i[edit update destroy]
  before_action :find_settings, only: :new
  before_action :find_connected_devices, only: :new

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(devices_params)

    if @device.save
      redirect_to settings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @device.update(devices_params)
      redirect_to settings_path
    else
      render :edit
    end
  end

  def destroy
    @device.destroy

    redirect_to settings_path
  end

  private

  def find_settings
    @settings = Setting.first
  end

  def find_device
    @device = Device.find(params[:id])
  end

  def find_connected_devices
    @connected_devices = @settings.online_devices_in_nmap - Device.pluck(:ip)
  end

  def devices_params
    params.require(:device).permit(:name, :ip, :mac, :always_online)
  end
end
