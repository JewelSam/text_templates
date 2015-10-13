require 'tokens_lists/tokens_list'
require 'mail_tokens/user_fio_token'
require 'mail_tokens/user_email_token'
require 'mail_tokens/confirmation_link_token'

class ConfirmEmailTokensList < TokensList

  def initialize
    @tokens_list = [UserFioToken, UserEmailToken, ConfirmationLinkToken]
  end

end