module Signup
  def create_user(locals = params)
    @error = []
    @error.push('Email is not valid') if not valid_email?(locals[:email])
    @error.push('Account with that email exists') if account_exists?(locals[:email])
    @error.push('Password is too short') if short_password?(locals[:password])
    @error.push('Passwords does not match') if not same_password?(locals[:password], locals[:confirm])
    return nil if @error != []
    locals.delete("confirm")
    User.create(locals)
  end

  private

  def account_exists?(email)
    User.find(email: email) != nil
  end

  def valid_email?(email)
    /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ =~ email
  end

  def same_password?(password, confirm)
    password == confirm
  end

  def short_password?(password)
    password.size < 0
  end
end
