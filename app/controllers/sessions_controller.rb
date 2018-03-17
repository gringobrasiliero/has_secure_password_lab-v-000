class SessionsController < ApplicationController
def create
  @user = User.find_by(name: params[:name])
  require_pass
  session[:user_id] = @user.id
end


private
def require_pass
  return head(:forbidden) unless @user.authenticate(params[:password])
end

end
