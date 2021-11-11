namespace :network do
  desc "Run every 3 minutes to check if anyone is home"
  task check_number_of_devices_at_home: :environment do
    created_at = Time.zone.now
    console_command_output = `nmap -sn 192.168.0.1-255`
    index = console_command_output.index(' hosts up') - 1
    number_of_connected_devices = console_command_output[index].to_i

    settings = Setting.first

    HomeOccupancy.create!(
      devices_number: number_of_connected_devices,
      is_home: settings.is_home_threshold <= number_of_connected_devices,
      created_at: created_at
    )

    settings.last_nmap_info = console_command_output
    settings.save(validate: false)
  end

  desc "Run once a day to delete old redundant records and save statistics"
  task delete_redundant_home_occupancy_records: :environment do
    yesterday_records = HomeOccupancy.yesterday_records

    statistic = Statistic.create!(
      home: yesterday_records.where(is_home: true).count,
      not_home: yesterday_records.where(is_home: false).count,
      date: Date.yesterday
    )
    from = to = nil

    yesterday_records.each do |record|
      from = record.created_at if from.nil? && !record.is_home
      to = record.created_at if from.present? && (record.is_home || record.equal?(yesterday_records.last))

      if (from.present? && to.present?)
        StatisticsNotHomeWindow.create!(
          from: from,
          to: to,
          statistic_id: statistic.id
        )
        from = to = nil
      end

      record.destroy! 
    end
  end
end
