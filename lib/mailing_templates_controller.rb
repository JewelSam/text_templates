require 'repositories/mailing_templates_repository'
require 'mail_tokens_extractor_factory'
require 'mailing_template_replacer'

class MailingTemplatesController
  # много аргументов, может, все-таки их нужно в хэш запихнуть?
  def confirm_email(template_type, user_id, confirmation_link, repositories)

    template = repositories[:mailing_templates].find(template_type)

    mail_tokens_extractor = MailTokensExtractorFactory.find_by_type(template_type)

    # options - плохое название для переменной
    options = {user_id: user_id, confirmation_link: confirmation_link}
    mail_tokens_list = mail_tokens_extractor.prepare_tokens(options, repositories)

    replaced_body = MailingTemplateReplacer.replace_tokens_in_email(template, mail_tokens_list)

    # InviteUserMailer.deliver(user_email, subject, replaced_body)

  end

  # повторение метода confirm_email, что с этим делать?
  def birthday_email(template_type, user_id, promo_code_id, repositories)

    template = repositories[:mailing_templates].find(template_type)

    mail_tokens_extractor = MailTokensExtractorFactory.find_by_type(template_type)

    options = {user_id: user_id, promo_code: promo_code_id}
    mail_tokens_list = mail_tokens_extractor.prepare_tokens(options, repositories)

    replaced_body = MailingTemplateReplacer.replace_tokens_in_email(template, mail_tokens_list)

  end
end