require 'repositories/mailing_templates_repository'
require 'mail_tokens_extractor_factory'
require 'mailing_template_replacer'

class MailingTemplatesController
  def confirm_email(template_type, user_id, repositories)

    template = repositories[:mailing_templates].find_by_type(template_type)

    mail_tokens_extractor = MailTokensExtractorFactory.find_by_type(template_type)

    mail_tokens_list = mail_tokens_extractor.prepare_tokens({user_id: user_id}, repositories)

    replaced_body = MailingTemplateReplacer.replace_tokens_in_email(template, mail_tokens_list)

    # InviteUserMailer.deliver(user_email, subject, replaced_body)

  end
end