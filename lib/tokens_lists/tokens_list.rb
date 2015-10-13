class TokensList

  attr_reader :tokens_list

  def initialize
    @tokens_list = []
  end

  def prepare_tokens(options = {}, repositories)
    @tokens_list.map do |token|
      token.prepare_token(options, repositories)
    end
  end

end