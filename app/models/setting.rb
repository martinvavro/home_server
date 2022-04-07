class Setting < ApplicationRecord
  def online_devices_in_nmap
    ips = []
    last_nmap_info.each_line do |line| 
      ips << line[/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/]
    end

    ips.compact
  end

  def online_devices
    Device.where(online: true)
  end

  def home?
    online_devices.length >= is_home_threshold
  end
end
