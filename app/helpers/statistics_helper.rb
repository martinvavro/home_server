module StatisticsHelper
  def day_polling_interval
    (Date.today.beginning_of_day.to_time.to_i..Date.today.end_of_day.to_time.to_i).step(3.minute)
  end

  def statistic_windows_json(id)
    @statistics.find(id).windows.map { |el| [hours_minutes_int(el.from), hours_minutes_int(el.to)] }.to_json
  end

  def hours_minutes_int(time)
    time.strftime('%H%M').to_i
  end
end
