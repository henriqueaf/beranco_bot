# frozen_string_literal: true

Telegram.bots_config = {
  # Default bot can be accessed with 'Telegram.bot'
  default: { token: ENV['TELEGRAM_BOT_TOKEN'], username: 'BerancoBot' }
  # Others bot can be accessed with Telegram.bots[:chat]
  # chat: {token: CHAT_BOT_TOKEN, username: 'chatbot'}
}

Telegram.bot.set_webhook(
  url: "#{ENV['DOMAIN_URL']}#{ENV['TELEGRAM_BOT_TOKEN']}"
)
