require 'repositories/repository'

RSpec.describe Repository do

  repository = Repository.new

  describe '::put' do
    context 'when primary key and value are valid' do
        it 'should add object to repository' do
            repository.put('id', 'value')
            expect(repository.collection['id']).to eq('value')
        end
    end

    context 'when primary key is nil' do
      it 'should raise argument error' do
        expect {repository.put(nil, 'value')}.to raise_error(ArgumentError)
      end
    end

    context 'when value is nil' do
      it 'should raise argument error' do
        expect {repository.put('id', nil)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '::find' do
    context 'when primary key is found' do
      it 'should return value' do
        body = repository.find('id')
        expect(body).to eq('value')
      end
    end

    context 'when primary key is not found' do
      it 'should raise not found error' do
        expect {repository.find('id2')}.to raise_error(NotFoundError)
      end
    end
  end

end