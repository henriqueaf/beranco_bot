# frozen_string_literal: true

require_relative '../test_helper'

# Test BerancoBot class
class BerancoBotTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BerancoBot
  end

  def test_it_says_hello_world
    data = {
      'update_id' => 187_995_057,
      'message' => {
        'message_id' => 173,
        'from' => {
          'id' => 791_711_241,
          'is_bot' => false,
          'first_name' => 'Henrique',
          'last_name' => 'Almeida',
          'language_code' => 'pt-br'
        },
        'chat' => {
          'id' => 791_711_241,
          'first_name' => 'Henrique',
          'last_name' => 'Almeida',
          'type' => 'private'
        },
        'date' => 1_556_917_221,
        'text' => '/address 60010',
        'entities' => [{
          'offset' => 0,
          'length' => 8,
          'type' => 'bot_command'
        }]
      }
    }

    post "/#{ENV['TELEGRAM_BOT_TOKEN']}", data.to_json

    assert last_response.ok?
    # assert_equal 'Hello World', last_response.body
  end
end
