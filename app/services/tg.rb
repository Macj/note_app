require 'telegram/bot'

class Tg
  Token = Rails.application.credentials.telegram[:secret]
  @@chat_id = Rails.application.credentials.telegram[:chat_id]

  def self.chat_the text
    Telegram::Bot::Client.run(Token) do |bot|
      bot.api.send_message(chat_id: @@chat_id, text: text)
    end
  end
end