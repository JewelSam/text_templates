class DurationTokenPresenter

  def self.format_token(token)
    days = token.value

    formatted_token = "#{days} "

    formatted_token +=  case days%10
                        when 0 then 'дней'
                        when 1..4 then 'дня'
                        else 'дней'
                        end
  end

end