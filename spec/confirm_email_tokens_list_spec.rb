require 'tokens_lists/confirm_email_tokens_list'
require 'repositories/users_repository'

RSpec.describe ConfirmEmailTokensList do

  confirm_email_tokens_list = ConfirmEmailTokensList.new

  users_repository = UsersRepository.new
  users_repository.put(1, 'fio')

  describe '::tokens_lists' do
    it 'should include UserFioToken' do
      expect(confirm_email_tokens_list.tokens_list).to include(UserFioToken)
    end
  end

  describe '::prepare_tokens' do
    context 'when prepare tokens' do

      subject(:mail_tokens_list) do
        repositories = {users: users_repository}
        mail_tokens_list = confirm_email_tokens_list.prepare_tokens({user_id: 1}, repositories)
      end

      it 'should contain UserFioToken' do
        # здесь встроенный matcher, что вроде как нехорошо и проверяется только первый элемент
        # (т.е. если вставить второй - то тесты все равно пройдут)
        expect(mail_tokens_list.first).to be_instance_of(UserFioToken)
      end

      it 'should contain UserFioToken with value "fio"' do
        expect(mail_tokens_list.first.value).to eq('fio')
      end

    end
  end

end