require 'mail_tokens/mail_token'
require 'token_type'

class UserFioToken < MailToken

  def type
    TokenType::String
  end

  # def MailToken.name
  #   NAME
  # end
  def name
    'user_fio'.freeze
  end

  def self.prepare_token(options, repositories)
    raise ArgumentError, 'user id is blank' unless options[:user_id]
    raise ArgumentError, 'users repository is not found' unless repositories[:users]

    user = repositories[:users].find(options[:user_id])
    new(user[:fio])
  end
end