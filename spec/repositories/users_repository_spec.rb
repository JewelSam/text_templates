require 'repositories/users_repository'

RSpec.describe UsersRepository do

  users_repository = UsersRepository.new

  describe '::put' do
    context 'when attributes are valid' do
        it 'should add user to users repository' do
            users_repository.put(1, 'fio', 'from@example.com')
            expect(users_repository.collection[1]).to eq({fio: 'fio', email: 'from@example.com'})
        end
    end

    context 'when user id is nil' do
      it 'should raise argument error' do
        expect {users_repository.put(nil, 'fio')}.to raise_error(ArgumentError)
      end
    end

    context 'when user fio is nil' do
      it 'should raise argument error' do
        expect {users_repository.put(1, nil)}.to raise_error(ArgumentError)
      end
    end

    context 'when user email is nil' do
      it 'should raise argument error' do
        expect {users_repository.put(1, 'fio', nil)}.to raise_error(ArgumentError)
      end
    end
  end

end