class UserController < ApplicationController 
  def index
    users = User.all
    render("index.slang")
  end

  def show
    if user = User.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect_to "/users"
    end
  end

  def new
    user = User.new
    render("new.slang")
  end

  def create
    user = User.new(params.to_h.select(["email"]))
    user.password = params["password"]

    if user.valid? && user.save
      flash["success"] = "Created User successfully."
      redirect_to "/users"
    else
      flash["danger"] = "Could not create User!"
      render("new.slang")
    end
  end

  def edit
    if user = User.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect_to "/users"
    end
  end

  def update
    if user = User.find(params["id"])
      user.set_attributes(params.to_h.select(["email"]))
      user.password = params["password"]
      
      if user.valid? && user.save
        flash["success"] = "Updated User successfully."
        redirect_to "/users"
      else
        flash["danger"] = "Could not update User!"
        render("edit.slang")
      end
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
      redirect_to "/users"
    end
  end

  def destroy
    if user = User.find params["id"]
      user.destroy
    else
      flash["warning"] = "User with ID #{params["id"]} Not Found"
    end
    redirect_to "/users"
  end
end
