require 'token_presenters/duration_token_presenter'
require 'mail_tokens/promo_code_duration_token'

RSpec.describe DurationTokenPresenter do
  describe '::format_token' do
    it 'should format number to period in days' do
      formatted_token = DurationTokenPresenter.format_token(PromoCodeDurationToken.new(15))
      expect(formatted_token).to eq('15 дней')
    end
  end
end