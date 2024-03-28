module RemindersHelper
  def status_color(reminder)
    case reminder.status
    when 'Pending'
      'warning'
    when 'Completed'
      'success'
    when 'InProgress'
      'primary'
    else
      'secondary'
    end
  end
end
