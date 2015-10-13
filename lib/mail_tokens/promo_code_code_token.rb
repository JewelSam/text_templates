require 'mail_tokens/mail_token'
require 'token_type'

class PromoCodeCodeToken < MailToken

  def type
    TokenType::String
  end

  # дурацкое название
  def name
    'promo_code_code'.freeze
  end

  def self.prepare_token(options, repositories)
    raise ArgumentError, 'promo code is blank' unless options[:promo_code]
    raise ArgumentError, 'promo codes repository is not found' unless repositories[:promo_codes]

    promo_code = repositories[:promo_codes].find(options[:promo_code])
    new(promo_code[:code])
  end
end