require 'repositories/repository'

class PromoCodesRepository < Repository

  def put(code, value, start, finish)
    raise ArgumentError, 'code is blank'              unless code
    raise ArgumentError, 'promo code value is blank'  unless value

    raise ArgumentError, 'promo code start is blank'      unless start
    raise ArgumentError, 'promo code start is not date'   unless start.is_a?(Date)

    raise ArgumentError, 'promo code finish is blank'     unless finish
    raise ArgumentError, 'promo code finish is not date'  unless finish.is_a?(Date)

    raise ArgumentError, 'promo code finish less than start' if finish <= start

    # ничего, что мы здесь используем @collection, который определяем в классе Repository?
    @collection[code] = {value: value, start: start, finish: finish}
  end

end