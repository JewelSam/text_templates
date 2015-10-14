require 'mail'
require 'letter_opener'

class Mailer
  def self.deliver(email, subject, body)
    mail = Mail.new do
      from    'no-reply@example.com'
      to      email
      subject subject

      html_part do
        content_type  'text/html; charset=UTF-8'
        body          body
      end
    end

    mail.delivery_method LetterOpener::DeliveryMethod, location: File.expand_path('../tmp/letter_opener', __FILE__)

    mail.deliver!
  end
end