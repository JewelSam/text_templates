require 'not_found_error'

class PromoCodesRepository
  attr_accessor :promo_codes

  def initialize
    @promo_codes = {}
  end

  def find(code)
     @promo_codes[code] || raise(NotFoundError, 'Promo code is not found')
  end

  def put(code, value, start, finish)
    raise ArgumentError, 'code is blank'              unless code
    raise ArgumentError, 'promo code value is blank'  unless value

    @promo_codes[code] = {value: value, start: start, finish: finish}
  end

end