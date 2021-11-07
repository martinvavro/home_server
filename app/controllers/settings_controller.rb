class SettingsController < ApplicationController
  before_action :find_settings, only: %i[edit update]

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

  private

  def find_settings
    @settings = Setting.first
  end

  def settings_params
    params.require(:setting).permit(:is_home_threshold, :alarm, :alarm_time, :sunset_offset)
  end
end