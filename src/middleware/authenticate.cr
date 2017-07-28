class HTTP::Server::Context
  property current_user : User?
end

class Authenticate < Amber::Pipe::Base
  def call(context)
    user_id = context.session["user_id"]?
    if user = User.find user_id
      context.current_user = user
      call_next(context)
    else
      return call_next(context) if ["/login","/session"].includes?(context.request.path)
      context.flash[:warning] = "Please login"
      context.response.headers.add "Location", "/login"
      context.response.status_code = 302
    end
  end
end
