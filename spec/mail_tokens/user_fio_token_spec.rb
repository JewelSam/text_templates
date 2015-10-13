require 'mail_tokens/user_fio_token'

RSpec.describe UserFioToken do
  describe '::build' do

    context 'when user fio token is built' do
      it 'should has string type' do
        user_fio_token = UserFioToken.new('value')
        expect(user_fio_token.type).to eq('string')
      end

      it 'should user_fio name' do
        user_fio_token = UserFioToken.new('value')
        expect(user_fio_token.name).to eq('user_fio')
      end

      it 'should have value' do
        user_fio_token = UserFioToken.new('value')
        expect(user_fio_token.value).to eq('value')
      end
    end

  end
end