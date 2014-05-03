module SessionTestHelper   
  def login(user)
    return true if User.where(:email => user.email).first 
    return false
    #request.session[:user] = user.id
  end

  def current_user
    User.find(request.session[:user])
  end
end