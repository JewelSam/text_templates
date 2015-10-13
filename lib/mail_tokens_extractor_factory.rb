require 'mailing_template'
require 'tokens_lists/confirm_email_tokens_list'
require 'tokens_lists/birthday_email_tokens_list'

class MailTokensExtractorFactory
  def self.find_by_type(type)
    case type
    when MailingTemplate::CONFIRM_EMAIL
      ConfirmEmailTokensList.new
    when MailingTemplate::BIRTHDAY_EMAIL
      BirthdayEmailTokensList.new
    else
      raise ArgumentError, "Invalid mailing template type provided"
    end
  end
end