# app/helpers/reminders_helper.rb
module RemindersHelper
  def status_color(status)
    case status
    when "À faire"
      'warning'
    when 'Terminé'
      'success'
    when 'En cours'
      'primary'
    else
      'secondary'
    end
  end
end
