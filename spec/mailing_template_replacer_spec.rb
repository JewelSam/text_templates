require 'mailing_template_replacer'
require 'mail_tokens/user_fio_token'

RSpec.describe MailingTemplateReplacer do
  describe '::replace_tokens_in_email' do
    # как это протестировать? передавать разные токены? или как?
    it 'should replace tokens in body' do
      body = "Здравствуйте, %{user_fio}!"
      tokens = [UserFioToken.new('fio')]

      replaced_body = MailingTemplateReplacer.replace_tokens_in_email(body, tokens)

      expect(replaced_body).to eq("Здравствуйте, fio!")
    end
  end
end