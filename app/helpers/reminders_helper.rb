module RemindersHelper
  def status_class(status)
    status.parameterize(separator: '-')
  end
end
