class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })

    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "You've logged in."
        redirect_to "/places"
      else
        flash["notice"] = "Login failed."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Login failed."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "You've logged out."
    redirect_to "/login"
  end
end