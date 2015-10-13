require 'tokens_lists/tokens_list'
require 'mail_tokens/user_fio_token'
require 'mail_tokens/user_email_token'
require 'mail_tokens/confirmation_link_token'

class ConfirmEmailTokensList < TokensList
  attr_reader :tokens_list

  def initialize
    @tokens_list = [UserFioToken, UserEmailToken, ConfirmationLinkToken]
  end

  def prepare_tokens(options = {}, repositories)
    @tokens_list.map do |token|
      token.prepare_token(options, repositories)
    end
  end

end