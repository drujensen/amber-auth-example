class SessionController < ApplicationController 
  def new
    render("new.slang")
  end

  def create
    email = params["email"]
    password = params["password"]
    user = User.find_by :email,  email
    if user && user.authenticate(password)
        session["user_id"] = user.id.to_s
        flash["info"] = "Successfully logged in"
        redirect_to "/"
      else
        flash["danger"] = "Invalid email or password"
        render("new.slang")
      end
  end

  def delete
    context.clear_session
    flash["info"] = "Logged out.  See ya later!"
    redirect_to "/"
  end
end
