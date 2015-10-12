require 'token_presenter_factory'
require 'token_presenters/string_token_presenter'

class MailingTemplateReplacer
  def self.replace_tokens_in_email(body, tokens)
    tokens.each do |token|
      token_presenter = TokenPresenterFactory.get_presenter(token.type)
      body.gsub!(/%{#{token.name}}/, token_presenter.format_token(token))
    end

    body
  end
end