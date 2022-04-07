class SettingsController < ApplicationController
  before_action :find_devices, only: %i[edit update]
  before_action :find_settings, only: %i[edit update perform_nmap_scan]

  def new
    @settings = Setting.new
  end

  def create
    @settings = Setting.new(settings_params)

    if @settings.save
      redirect_to settings_path
    else
      render :new
    end
  end

  def edit
    redirect_to new_setting_path if @settings.nil?
  end

  def update
    if @settings.update(settings_params)
      redirect_to settings_path
    else
      render :edit
    end
  end

  def perform_nmap_scan
    console_command_output = `nmap -sn 192.168.0.1-255`   

    @settings.last_nmap_info = console_command_output
    @settings.save

    redirect_back fallback_location: root_path
  end

  private

  def find_settings
    @settings = Setting.first
  end

  def find_devices
    @devices = Device.all.order(online: :desc)
  end

  def settings_params
    params.require(:setting).permit(:is_home_threshold, :alarm, :alarm_time, :sunset_offset)
  end
end
