class SettingsController < ApplicationController
  def index
    @settings = Setting.first
    if @settings.nil?
      redirect_to new_setting_path
    else
      redirect_to @settings
    end
  end

  def show
    @settings = Setting.first
  end

  def new
    @settings = Setting.new
  end

  def create
    @settings = Setting.new(settings_params)

    if @settings.save
      redirect_to @settings
    else
      render :new
    end
  end

  def edit
    @settings = Setting.first
  end

  def update
    @settings = Setting.first

    if @settings.update(settings_params)
      redirect_to @settings
    else
      render :edit
    end
  end

  private

  def settings_params
    params.require(:setting).permit(:is_home_threshold, :alarm, :alarm_time, :sunset_offset)
  end
end
