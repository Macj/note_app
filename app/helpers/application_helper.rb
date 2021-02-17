module ApplicationHelper
  def date_formatted date
    date.strftime("%H:%M %a, %B %d, %Y")
  end
end
