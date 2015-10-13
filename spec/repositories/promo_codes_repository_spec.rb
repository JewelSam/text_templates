require 'repositories/promo_codes_repository'

RSpec.describe PromoCodesRepository do

  promo_codes_repository = PromoCodesRepository.new

  describe '::put' do
    context 'when attributes are valid' do
        it 'should add user to users repository' do
            promo_code_start = Date.today
            promo_code_finish = promo_code_start + 15

            promo_codes_repository.put('code', 'value', promo_code_start, promo_code_finish)
            expect(promo_codes_repository.collection['code']).to eq({value: 'value', start: promo_code_start, finish: promo_code_finish})
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

end