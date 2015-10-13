require 'not_found_error'

# когда наследование плохо? когда мы не видим те методы, которые наследуем?
class Repository

  attr_accessor :collection

  def initialize
    @collection = {}
  end

  def find(primary_key)
     @collection[primary_key] || raise(NotFoundError, 'Object is not found in repository')
  end

  def put(primary_key, value)
    raise ArgumentError, 'primary key is blank' unless primary_key
    raise ArgumentError, 'value is blank' unless value

    @collection[primary_key] = value
  end
end