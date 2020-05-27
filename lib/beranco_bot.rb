# frozen_string_literal: true

# Modular Main class to be called for sinatra
class BerancoBot < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure :production, :development, :test do
    enable :logging
  end

  post %r{/#{ENV['TELEGRAM_BOT_TOKEN']}} do
    logger.info 'Receiving request...'

    status 200

    # Parse response body to JSON
    data = JSON.parse(request.body.read)

    # Regex: anything until reach a space
    route = data['message']['text'].scan(%r{/[^\s]+}).first

    # Get the message text to send to telegram's bot
    response_message = case route
                       when '/address'
                         Handlers::Correios.new(data['message']).to_s
                       end

    if response_message
      Telegram.bot.send_message(
        chat_id: data['message']['chat']['id'],
        text: response_message
      )
    end

    {} # Return an empty json, to say "ok" to Telegram
  end
end
