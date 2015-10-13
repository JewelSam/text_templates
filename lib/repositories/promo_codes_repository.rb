require 'repositories/repository'

class PromoCodesRepository < Repository

  def put(code, value, start, finish)
    raise ArgumentError, 'code is blank'              unless code
    raise ArgumentError, 'promo code value is blank'  unless value

    # ничего, что мы здесь используем @collection, который определяем в классе Repository?
    @collection[code] = {value: value, start: start, finish: finish}
  end

end