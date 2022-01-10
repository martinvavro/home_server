class Setting < ApplicationRecord
  def online_devices
    ips = []
    last_nmap_info.each_line do |line| 
      ips << line[/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/]
    end

    ips.compact
  end

  def home?
    always_online_ips = Device.where(always_online: true).pluck(:ip)
    total_ao_count = always_online_ips.length
    currently_online_ips = online_devices

    always_online_ips -= currently_online_ips

    if always_online_ips.length < total_ao_count / 3
      # valid reading
      currently_online_ips.length > is_home_threshold
    else
      # anomalous reading
      # keep previous value
      # TODO, warning log
      HomeOccupancy.last.is_home
    end
  end
end
