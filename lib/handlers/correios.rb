# frozen_string_literal: false

require 'correios_br'

module Handlers
  # Public: A class that implements CorreiosBr to use as a handler
  class Correios
    def initialize(message_hash = {})
      @message_text = message_hash['text']
    end

    def to_s
      address
    end

    private

    def address
      cep = @message_text.scan(/\s.+/).first&.strip

      begin
        address_hash = CorreiosBr::CEP.get_address(cep)
      rescue ArgumentError => e
        return e.message
      end

      parse_address_hash(address_hash)
    end

    def parse_address_hash(address_hash)
      new_hash = address_hash.slice(
        :zipcode,
        :address,
        :complement,
        :neighborhood,
        :city,
        :state,
        :ibge
      )

      result = "Address\n"
      new_hash.each do |k, v|
        result << "#{k}: #{v}\n"
      end
      result
    end
  end
end
