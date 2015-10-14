require 'tokens_lists/tokens_list'
require 'mail_tokens/user_fio_token'
require 'mail_tokens/promo_code_code_token'
require 'mail_tokens/promo_code_duration_token'
require 'mail_tokens/promo_code_value_token'

class BirthdayEmailTokensList < TokensList

  def initialize
    @tokens_list = [UserFioToken, PromoCodeCodeToken, PromoCodeDurationToken, PromoCodeValueToken]
  end

end