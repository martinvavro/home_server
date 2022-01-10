module DevicesHelper
  def available_devices
    @settings.online_devices - Device.pluck(:ip)
  end
end
