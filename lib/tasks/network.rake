namespace :network do
  desc "Run every 3 minutes to check if anyone is home"
  task check_number_of_devices_at_home: :environment do
    console_command_output = `nmap -sn 192.168.0.1-255`
    index = console_command_output.index(' hosts up') - 1
    number_of_connected_devices = console_command_output[index].to_i

    settings = Setting.first

    HomeOccupancy.create!(
      devices_number: number_of_connected_devices,
      is_home: settings.is_home_threshold <= number_of_connected_devices,
      created_at: Time.zone.now
    )

    settings.last_nmap_info = console_command_output
    settings.save(validate: false)
  end

  desc "Run once a day to delete old redundant records"
  task delete_redundant_home_occupancy_records: :environment do
    yesterday_records = HomeOccupancy.where(created_at: (Date.yesterday.beginning_of_day..Date.yesterday.end_of_day))
    
    yesterday_records.each do |record|
      hour = record.created_at.hour
      time = Date.yesterday + hour.hours
      count = HomeOccupancy.where(created_at: time.beginning_of_hour..time.end_of_hour).count

      record.destroy! unless count == 1
    end
  end
end
