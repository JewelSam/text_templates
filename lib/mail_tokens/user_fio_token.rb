require 'mail_tokens/mail_token'
require 'token_type'

class UserFioToken < MailToken
  attr_reader :value

  def type
    TokenType::String
  end

  # def MailToken.name
  #   NAME
  # end
  def name
    'user_fio'.freeze
  end

  # у Руслана был build, пишет Failure/Error: user_fio_token = UserFioToken.new('value')
  #   ArgumentError:
  #       wrong number of arguments (1 for 0)
  def initialize(value = '')
    @value = value
  end
end