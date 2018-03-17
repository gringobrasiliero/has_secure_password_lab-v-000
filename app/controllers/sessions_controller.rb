class SessionsController < ApplicationController
def create
user = User.find_by(:name => params.require(:user).permit(:name)[:name])
if user
  if user.authenticate(params.require(:user).permit(:password)[:password])
session[:user_id] = user.id
redirect_to user_path(user)
else
  redirect_to login_path
end
else
  redirect_to new_user_path
end
end

def destroy
  session.delete :user_id
  redirect_to login_path
end


end
