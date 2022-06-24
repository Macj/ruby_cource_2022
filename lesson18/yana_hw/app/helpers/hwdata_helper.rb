module HwdataHelper
  def now
    Time.now
  end

  def hour
    60*60
  end

  def num_str(num, one_line, multiple_line)
    (num != 1) ? multiple_line : one_line
  end

  def days_str(days)
    num_str(days, 'день', 'дней')
  end

  def hours_str(hours)
    num_str(hours, 'час', 'часов')
  end

  def time_line(elems, method_name)
    "#{elems} - #{send(method_name, elems)}"
  end

  def show(date)
    date.strftime("%d.%m.%Y %H:%M")
  end
end
