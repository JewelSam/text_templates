require 'mailing_templates_controller.rb'
require 'repositories/users_repository.rb'

RSpec.describe MailingTemplatesController do
  templates_repository = MailingTemplatesRepository.new

  users_repository = UsersRepository.new
  users_repository.put(1, 'fio', 'from@example.com')

  describe '::confirm_email' do
    context 'when email is sent' do
      it 'should send with replaced body' do

        body = 'Здравствуйте, %{user_fio}! Ваш e-mail %{user_email} был указан при регистрации. ' +
                'Перейдите по <a href="%{confirmation_link}">ссылке</a> для подтверждения.'
        templates_repository.put('confirm_email', body)

        template_type = 'confirm_email'
        user_id = 1
        user_email = 'from@example.com'
        confirmation_link = 'http://example.com'
        repositories = {mailing_templates: templates_repository, users: users_repository}

        mailing_templates_controller = MailingTemplatesController.new
        mail = mailing_templates_controller.confirm_email(
          template_type,
          user_id,
          user_email,
          confirmation_link,
          repositories
        )

        expect(mail.html_part.body).to eq('Здравствуйте, fio! Ваш e-mail from@example.com был указан при регистрации. ' +
                'Перейдите по <a href="http://example.com">ссылке</a> для подтверждения.')

        # почти полное повторение mailing_template_replacer_spec, что с этим делать?
      end
    end
  end


  describe '::birthday_email' do
    context 'when email is sent' do
      it 'should send with replaced body' do

        body = 'Здравствуйте, %{user_fio}! ' +
                  'В этот замечательный день мы дарим вам скидку %{promo_code_value} по промо-коду: ' +
                  '%{promo_code}. Скидка по промокоду будет действовать %{promo_code_duration}.'
        templates_repository.put('birthday_email', body)

        users_repository = UsersRepository.new
        users_repository.put(1, 'fio', 'from@example.com')

        promo_codes_repository = PromoCodesRepository.new
        promo_code_start = Date.today
        promo_code_finish = promo_code_start + 15
        promo_codes_repository.put('code', 1000, promo_code_start, promo_code_finish)

        template_type = 'birthday_email'
        user_id = 1
        user_email = 'from@example.com'
        promo_code = 'code'
        repositories = {
          mailing_templates: templates_repository,
          users: users_repository,
          promo_codes: promo_codes_repository
        }

        mailing_templates_controller = MailingTemplatesController.new
        mail = mailing_templates_controller.birthday_email(
          template_type,
          user_id,
          user_email,
          promo_code,
          repositories
        )

        expect(mail.html_part.body).to eq('Здравствуйте, fio! ' +
                  'В этот замечательный день мы дарим вам скидку 1000 руб по промо-коду: ' +
                  'code. Скидка по промокоду будет действовать 15 дней.')
      end
    end
  end
end