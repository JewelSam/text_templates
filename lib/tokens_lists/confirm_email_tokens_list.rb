require 'tokens_lists/tokens_list'

class ConfirmEmailTokensList < TokensList  
  attr_reader :tokens_list

  def initialize
    @tokens_list = [UserFioToken] 
  end
  # здесь было сложнее, но я не уверена, что так должно быть
  # как протестировать этот метод? не понимаю. Значит, что-то в нем не так?

end