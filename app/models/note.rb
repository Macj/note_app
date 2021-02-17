require 'tg'

class Note < ApplicationRecord
  belongs_to :user
  after_create :make_notifications

  def make_notifications
    # Take signal_date and make delayed job for sending reminds
    message = "Hey! Remember about -> #{title}?"
    delay(run_at: signal_date, queue: "notifications_#{id}").send_notification(message)
  end

  def send_notification(message)
    Tg.chat_the message
  end
end
