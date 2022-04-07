class Device < ApplicationRecord
  def status
    if online?
      "Online"
    else
      "Offline" 
    end
  end

  def perform_scan(count = 1)
    self.online = always_online || system("timeout 0.5 ping -c #{count} #{ip}", out: File::NULL)

    save
  end
end
