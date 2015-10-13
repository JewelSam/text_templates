require 'repositories/promo_codes_repository'

RSpec.describe PromoCodesRepository do

  promo_codes_repository = PromoCodesRepository.new

  describe '::put' do
    context 'when attributes are valid' do
        it 'should add user to users repository' do
            promo_codes_repository.put('code', 'value', 'start', 'finish')
            expect(promo_codes_repository.promo_codes['code']).to eq({value: 'value', start: 'start', finish: 'finish'})
        end
    end

    context 'when code is nil' do
      it 'should raise argument error' do
        expect {promo_codes_repository.put(nil, 'value')}.to raise_error(ArgumentError)
      end
    end

    context 'when promo code value is nil' do
      it 'should raise argument error' do
        expect {promo_codes_repository.put('code', nil)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '::find' do
    context 'when code is found' do
      it 'should return promo code' do
        promo_code = promo_codes_repository.find('code')
        expect(promo_code).to eq({value: 'value', start: 'start', finish: 'finish'})
      end
    end

    context 'when user id is not found' do
      it 'should raise not found error' do
        expect {promo_codes_repository.find('code2')}.to raise_error(NotFoundError)
      end
    end
  end

end