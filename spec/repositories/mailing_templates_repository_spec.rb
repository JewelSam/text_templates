require 'repositories/mailing_templates_repository'

RSpec.describe MailingTemplatesRepository do

  templates_repository = MailingTemplatesRepository.new

  describe '::put' do
    context 'when template type and body are valid' do
        it 'should add template to templates repository' do
            templates_repository.put('type', 'body')
            expect(templates_repository.templates['type']).to eq('body')
        end
    end

    context 'when template type is nil' do
      it 'should raise argument error' do
        expect {templates_repository.put(nil, 'body')}.to raise_error(ArgumentError)
      end
    end

    context 'when template body is nil' do
      it 'should raise argument error' do
        expect {templates_repository.put('type', nil)}.to raise_error(ArgumentError)
      end
    end
  end

  describe '::find_by_type' do
    context 'when type is found' do
      it 'should return body' do
        body = templates_repository.find_by_type('type')
        expect(body).to eq('body')
      end
    end

    context 'when type is not found' do
      it 'should raise not found error' do
        expect {templates_repository.find_by_type('type2')}.to raise_error(NotFoundError)
      end
    end
  end

end