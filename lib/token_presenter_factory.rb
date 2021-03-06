require 'token_presenters/string_token_presenter'

class TokenPresenterFactory
  def self.get_presenter(token_type)
    case token_type
    when TokenType::String
      StringTokenPresenter
    when TokenType::Currency
      CurrencyTokenPresenter
    when TokenType::Duration
      DurationTokenPresenter
    else
      raise ArgumentError, "Invalid token type provided"
    end
  end
end