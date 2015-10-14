require 'tokens_lists/birthday_email_tokens_list'
require 'repositories/users_repository'
require 'repositories/promo_codes_repository'

RSpec.describe BirthdayEmailTokensList do

  birthday_email_tokens_list = BirthdayEmailTokensList.new

  # повторение одних и тех же действий, нужно ли это выносить?
  users_repository = UsersRepository.new
  users_repository.put(1, 'fio', 'from@example.com')

  promo_codes_repository = PromoCodesRepository.new

  promo_code_start = Date.today
  promo_code_finish = promo_code_start + 15

  promo_codes_repository.put('code', 'value', promo_code_start, promo_code_finish)

  describe '::prepare_tokens' do
    context 'when prepare tokens' do

      subject(:mail_tokens_list) do
        repositories = {users: users_repository, promo_codes: promo_codes_repository}
        options = {user_id: 1, promo_code: 'code'}

        mail_tokens_list = birthday_email_tokens_list.prepare_tokens(options, repositories)
      end

      it 'should contain four token' do
        expect(mail_tokens_list.length).to be(4)
      end

      it 'should contain UserFioToken with value "fio"' do
        user_fio_token = mail_tokens_list.find {|token| token.is_a?(UserFioToken)}
        expect(user_fio_token.value).to eq('fio')
      end

    end
  end

end