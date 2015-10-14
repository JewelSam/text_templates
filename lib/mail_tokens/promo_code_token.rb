require 'mail_tokens/mail_token'
require 'token_type'

class PromoCodeToken < MailToken

  def type
    TokenType::String
  end

  def name
    'promo_code'.freeze
  end

  def self.prepare_token(options, repositories)
    raise ArgumentError, 'promo code is blank' unless options[:promo_code]

    new(options[:promo_code])
  end
end