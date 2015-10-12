class TokenPresenterFactory
  def self.get_presenter(token_type)
    case token_type
    when TokenType::String
      StringTokenPresenter
    else
      raise ArgumentError, "Invalid token type provided"
    end
  end
end