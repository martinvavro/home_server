every 3.minutes do
  rake 'network:check_number_of_devices_at_home'
end

every 1.day do
  rake 'network:delete_redundant_home_occupancy_records'
end