require 'mailing_template_replacer'
require 'mail_tokens/user_fio_token'
require 'mail_tokens/user_email_token'

RSpec.describe MailingTemplateReplacer do
  describe '::replace_tokens_in_email' do
    # как это протестировать? передавать разные токены? или как?
    it 'should replace tokens in body' do
      body = 'Здравствуйте, %{user_fio}! Ваш e-mail %{user_email} был указан при регистрации. ' +
                'Перейдите по <a href="%{confirmation_link}">ссылке</a> для подтверждения.'

      tokens = [
        UserFioToken.new('fio'),
        UserEmailToken.new('from@example.com'),
        ConfirmationLinkToken.new('http://example.com')
      ]

      replaced_body = MailingTemplateReplacer.replace_tokens_in_email(body, tokens)

      expect(replaced_body).to eq('Здравствуйте, fio! Ваш e-mail from@example.com был указан при регистрации. ' +
                'Перейдите по <a href="http://example.com">ссылке</a> для подтверждения.')
    end
  end
end