# frozen_string_literal: true

require 'sinatra'
require 'dotenv/load'
require 'telegram/bot'
require_relative 'lib/handlers/correios'

bot = Telegram::Bot::Client.new(ENV['TELEGRAM_BOT_TOKEN'])
bot.set_webhook(url: "#{ENV['DOMAIN_URL']}#{ENV['TELEGRAM_BOT_TOKEN']}")

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

post %r{/#{ENV['TELEGRAM_BOT_TOKEN']}} do
  status 200

  # Parse response body to JSON
  data = JSON.parse(request.body.read)

  # Regex: anything until reach a space
  route = data['message']['text'].scan(%r{/[^\s]+}).first

  response_message = case route
                     when '/address'
                       Handlers::Correios.new(data['message']).to_s
                     end

  bot.send_message(
    chat_id: data['message']['chat']['id'],
    text: response_message
  )

  {} # Return an empty json, to say "ok" to Telegram
end
