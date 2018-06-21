class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    #세션에 저장되어있는 경우 @user을 찾아서 저장한당
    #||= 저장하는 이유는 @user가 비어있는경우에만 저장하기위해서이다.
    @user||=User.find(session[:user_id]) if session[:user_id]
  end
  def authorize
    if current_user.nil?
      flash[:alert]="do login"
      redirect_to '/'
    end
  end
end
