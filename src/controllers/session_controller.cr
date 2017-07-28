class SessionController < ApplicationController 
  def new
    render("new.slang")
  end

  def create
    user = User.find_by :email, params["email"]
    if user && user.authenticate(params["password"])
        session[:user_id] = user.id
        flash[:info] = "Successfully logged in"
        redirect_to "/"
      else
        flash[:danger] = "Invalid email or password"
        render("new.slang")
      end
  end

  def delete
    session.delete(:user_id)
    flash[:info] = "Logged out.  See ya later!"
    redirect_to "/"
  end
end
