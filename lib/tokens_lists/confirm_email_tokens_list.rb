require 'tokens_lists/tokens_list'
require 'mail_tokens/user_fio_token'

class ConfirmEmailTokensList < TokensList
  attr_reader :tokens_list

  def initialize
    @tokens_list = [UserFioToken]
  end
  # здесь было сложнее, но я не уверена, что так должно быть
  # как протестировать этот метод? не понимаю. Значит, что-то в нем не так?

  def prepare_tokens(options = {}, repositories)
    @tokens_list.map do |token|
      token.prepare_token(options, repositories)
    end
  end

end