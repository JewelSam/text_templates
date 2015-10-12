require 'repositories/users_repository'

RSpec.describe UsersRepository do

  users_repository = UsersRepository.new
  
  describe '::put' do 
    context 'when attributes are valid' do
        it 'should add user to users repository' do  
            users_repository.put(1, 'fio')
            expect(users_repository.users[1]).to eq({fio: 'fio'})
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
  end

  describe '::find' do 
    context 'when user id is found' do
      it 'should return user' do 
        user = users_repository.find(1)
        expect(user).to eq({fio: 'fio'})
      end 
    end

    context 'when user id is not found' do 
      it 'should raise not found error' do 
        expect {users_repository.find(2)}.to raise_error(NotFoundError)
      end
    end
  end

end 