require 'mail_tokens/mail_token'
require 'token_type'

class ConfirmationLinkToken < MailToken

  def type
    TokenType::String
  end

  def name
    'confirmation_link'.freeze
  end

  def self.prepare_token(options, repositories)
    raise ArgumentError, 'confirmation link is blank' unless options[:confirmation_link]

    new(options[:confirmation_link])
  end

end