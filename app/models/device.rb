class Device < ApplicationRecord
  def status
    if Setting.last.online_devices.include?(ip)
      "Online"
    elsif always_online? 
      "Anomaly"
    else
      "Offline" 
    end
  end
end
