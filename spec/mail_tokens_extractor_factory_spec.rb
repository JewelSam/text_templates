require 'mail_tokens_extractor_factory'

RSpec.describe MailTokensExtractorFactory do
  describe '::find_by_type' do
    context 'when type is confirm email' do
      it 'should return new ConfirmEmailTokensList' do
        mail_tokens_extractor = MailTokensExtractorFactory.find_by_type('confirm_email')
        expect(mail_tokens_extractor.class).to be(ConfirmEmailTokensList)
      end
    end

    context 'when type is birthday email' do
      it 'should return new BirthdayEmailTokensList' do
        mail_tokens_extractor = MailTokensExtractorFactory.find_by_type('birthday_email')
        expect(mail_tokens_extractor.class).to be(BirthdayEmailTokensList)
      end
    end
  end
end