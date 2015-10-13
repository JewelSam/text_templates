require 'mail_tokens/mail_token'
require 'token_type'

class UserEmailToken < MailToken

  def type
    TokenType::String
  end

  def name
    'user_email'.freeze
  end

  def self.prepare_token(options, repositories)
    raise ArgumentError, 'user id is blank' unless options[:user_id]
    raise ArgumentError, 'users repository is not found' unless repositories[:users]

    user = repositories[:users].find(options[:user_id])
    new(user[:email])
  end
end