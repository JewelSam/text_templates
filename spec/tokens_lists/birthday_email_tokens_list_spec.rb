require 'tokens_lists/birthday_email_tokens_list'
require 'repositories/users_repository'

RSpec.describe BirthdayEmailTokensList do

  birthday_email_tokens_list = BirthdayEmailTokensList.new

  # повторение одних и тех же действий, нужно ли это выносить?
  users_repository = UsersRepository.new
  users_repository.put(1, 'fio', 'from@example.com')

  describe '::prepare_tokens' do
    context 'when prepare tokens' do

      subject(:mail_tokens_list) do
        repositories = {users: users_repository}
        options = {user_id: 1}

        mail_tokens_list = birthday_email_tokens_list.prepare_tokens(options, repositories)
      end

      it 'should contain one token' do
        expect(mail_tokens_list.length).to be(1)
      end

      it 'should contain UserFioToken with value "fio"' do
        user_fio_token = mail_tokens_list.find {|token| token.is_a?(UserFioToken)}
        expect(user_fio_token.value).to eq('fio')
      end

    end
  end

end