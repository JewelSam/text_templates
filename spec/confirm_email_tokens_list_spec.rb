require 'tokens_lists/confirm_email_tokens_list'
require 'repositories/users_repository'

RSpec.describe ConfirmEmailTokensList do

  confirm_email_tokens_list = ConfirmEmailTokensList.new

  users_repository = UsersRepository.new
  users_repository.put(1, 'fio', 'from@example.com')

  describe '::prepare_tokens' do
    context 'when prepare tokens' do

      subject(:mail_tokens_list) do
        repositories = {users: users_repository}
        mail_tokens_list = confirm_email_tokens_list.prepare_tokens({user_id: 1}, repositories)
      end

      it 'should contain two tokens' do
        expect(mail_tokens_list.length).to be(2)
      end

      it 'should contain UserFioToken with value "fio"' do
        user_fio_token = mail_tokens_list.find {|token| token.is_a?(UserFioToken)}
        expect(user_fio_token.value).to eq('fio')
      end

      it 'should contain UserEmailToken with value "from@example.com"' do
        user_email_token = mail_tokens_list.find {|token| token.is_a?(UserEmailToken)}
        expect(user_email_token.value).to eq('from@example.com')
      end

    end
  end

end