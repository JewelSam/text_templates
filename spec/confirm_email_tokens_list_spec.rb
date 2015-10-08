require 'tokens_lists/confirm_email_tokens_list'

RSpec.describe ConfirmEmailTokensList do 

  describe '::tokens_lists' do
    it 'should include UserFioToken' do 
      confirm_email_tokens_list = ConfirmEmailTokensList.new
      expect(confirm_email_tokens_list.tokens_list).to include(UserFioToken)
    end
  end

end 