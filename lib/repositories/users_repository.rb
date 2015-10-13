require 'not_found_error'

class UsersRepository
  attr_accessor :users

  def initialize
    @users = {}
  end

  def find(user_id)
     @users[user_id] || raise(NotFoundError, 'User is not found')
  end

  def put(user_id, fio, email)
    # валидации должны быть в каком-то другом месте?
    raise ArgumentError, 'user id is blank'   unless user_id
    raise ArgumentError, 'user fio is blank'  unless fio
    raise ArgumentError, 'user email is blank'  unless email

    @users[user_id] = {fio: fio, email: email}
  end

end