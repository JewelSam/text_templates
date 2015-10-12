require 'not_found_error'

class MailingTemplatesRepository
  attr_accessor :templates

  def initialize
    @templates = {}
  end

  def find_by_type(template_type)
     @templates[template_type] || raise(NotFoundError, 'Template is not found')
  end

  def put(template_type, template_body)
    # нельзя обработку ошибок делать здесь? отдельный класс? я не понимаю
    raise ArgumentError, 'template type is blank' unless template_type
    raise ArgumentError, 'template body is blank' unless template_body

    @templates[template_type] = template_body
  end

end