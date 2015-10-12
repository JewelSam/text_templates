require 'mailing_template'
require 'tokens_lists/confirm_email_tokens_list'

class MailTokensExtractorFactory
  def self.find_by_type(type)
    case type
    when MailingTemplate::CONFIRM_EMAIL
      ConfirmEmailTokensList.new
    else
      raise ArgumentError, "Invalid mailing template type provided"
    end
  end
end