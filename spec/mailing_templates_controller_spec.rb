require 'mailing_templates_controller.rb'

RSpec.describe MailingTemplatesController do
  describe '::confirm_email' do
    context 'when email is sent' do
      it 'should send with replaced body' do
        templates_repository = MailingTemplatesRepository.new
        body = 'Здравствуйте, %{user_fio}! Ваш e-mail %{user_email} был указан при регистрации. ' +
                'Перейдите по <a href="%{confirmation_link}">ссылке</a> для подтверждения.'
        templates_repository.put('confirm_email', body)

        users_repository = UsersRepository.new
        users_repository.put(1, 'fio', 'from@example.com')

        template_type = 'confirm_email'
        user_id = 1
        confirmation_link = 'http://example.com'
        repositories = {mailing_templates: templates_repository, users: users_repository}

        mailing_templates_controller = MailingTemplatesController.new
        replaced_body = mailing_templates_controller.confirm_email(
          template_type,
          user_id,
          confirmation_link,
          repositories
        )

        expect(replaced_body).to eq('Здравствуйте, fio! Ваш e-mail from@example.com был указан при регистрации. ' +
                'Перейдите по <a href="http://example.com">ссылке</a> для подтверждения.')

        # почти полное повторение mailing_template_replacer_spec, что с этим делать?
      end
    end
  end
end