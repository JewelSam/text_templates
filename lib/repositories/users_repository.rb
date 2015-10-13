require 'repositories/repository'

class UsersRepository < Repository

  # может, тоже нужно в Repository как attributes вынести?
  def put(user_id, fio, email)
    # валидации должны быть в каком-то другом месте? PresenceValidator какой-нибудь
    raise ArgumentError, 'user id is blank'   unless user_id
    raise ArgumentError, 'user fio is blank'  unless fio
    raise ArgumentError, 'user email is blank'  unless email

    @collection[user_id] = {fio: fio, email: email}
  end

end