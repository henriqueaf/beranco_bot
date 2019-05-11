# frozen_string_literal: true

require_relative './config/application'

# Telegram request example
# {
#   "update_id"=>187995057,
#   "message"=>{
#     "message_id"=>173,
#     "from"=>{
#       "id"=>791711241,
#       "is_bot"=>false,
#       "first_name"=>"Henrique",
#       "last_name"=>"Almeida",
#       "language_code"=>"pt-br"
#     }
#     "chat"=>{
#       "id"=>791711241,
#       "first_name"=>"Henrique",
#       "last_name"=>"Almeida",
#       "type"=>"private"
#     }
#     "date"=>1556917221,
#     "text"=>"/address 60010",
#     "entities"=>[{
#       "offset"=>0,
#       "length"=>8,
#       "type"=>"bot_command"
#     }]
#   }
# }

# Configure telegram webhook (url that telegram will send
# a post request every time the bot receives a message)
Telegram.bot.set_webhook(
  url: "#{ENV['DOMAIN_URL']}#{ENV['TELEGRAM_BOT_TOKEN']}"
)
