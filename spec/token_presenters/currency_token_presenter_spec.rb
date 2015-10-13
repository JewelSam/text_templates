require 'token_presenters/currency_token_presenter'
require 'mail_tokens/promo_code_value_token'

RSpec.describe CurrencyTokenPresenter do
  describe '::format_token' do
    it 'should format number to currency' do
      formatted_token = CurrencyTokenPresenter.format_token(PromoCodeValueToken.new(1000))
      expect(formatted_token).to eq('1000 руб')
    end
  end
end