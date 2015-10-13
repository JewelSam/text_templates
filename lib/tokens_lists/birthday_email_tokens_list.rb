require 'tokens_lists/tokens_list'
require 'mail_tokens/user_fio_token'

class BirthdayEmailTokensList < TokensList

  def initialize
    @tokens_list = [UserFioToken]
  end

end