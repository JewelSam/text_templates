require 'mailing_templates_controller.rb'

RSpec.describe MailingTemplatesController do
  describe '::confirm_email' do
    context 'when email is sent' do
      it 'should send with replaced body' do
        templates_repository = MailingTemplatesRepository.new
        templates_repository.put('confirm_email', 'Здравствуйте, %{user_fio}! Ваш e-mail %{user_email} был указан при регистрации.')

        users_repository = UsersRepository.new
        users_repository.put(1, 'fio', 'from@example.com')

        template_type = 'confirm_email'
        user_id = 1
        repositories = {mailing_templates: templates_repository, users: users_repository}

        mailing_templates_controller = MailingTemplatesController.new
        replaced_body = mailing_templates_controller.confirm_email(template_type, user_id, repositories)

        expect(replaced_body).to eq('Здравствуйте, fio! Ваш e-mail from@example.com был указан при регистрации.')

        # почти полное повторение mailing_template_replacer_spec, что с этим делать?
      end
    end
  end
end