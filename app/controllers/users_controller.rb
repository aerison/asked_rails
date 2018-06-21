class UsersController < ApplicationController

def Posts
  user=User.find(params[:id])
  @posts=user.posts
end
  def login
  end

  def logout
    session.clear
    flash[:notice]="bye"
    redirect_to '/'
  end

  def loginprocess
    #email가입되었는지 확인
    user=User.find_by(email:params[:email])
    #1-1.가입이 되었으면 비밀번호 확인
    if user
      if user.authenticate(params[:password])
    #1-1-1.비밀번호일치하면 로그인
        session[:user_id]=user.id
        flash[:notice]="#{user.username}, successfully login"
        redirect_to '/'
    #1-1-2.비밀번호가 다르면 에러메시지+back
  else
    flash[:alert]="wrong passwd"
    redirect_to :back
  end
    #1-2.가입안되었으면 가입하는 곳으로 보냄
  else
    flash[:alert]="no email"
    redirect_to '/signup'
  end
  end

  def index
  end

  def new
  end

  def create
    unless User.find_by(email:params[:email])
      @user=User.new(username:params[:username],
                        email:params[:email],
                        password:params[:password],
                        password_confirmation:params[:password_confirmation])
      if @user.save
        #가입이되면 true +save
        flash[:notice]="가입을 축하드립니다"
        redirect_to '/'
      else
        #비번달라서 가입이 안되면, false+don't save
        flash[:alert]="비밀번호가 다릅니다"
        redirect_to '/'
      end
    else
      flash[:alert]="등록된 이메일 입니다"
      redirect_to :back
    end


  #   #1.email 검증 User.find_by(email: 값)
  #   unless User.find_by(email:params[:email])
  #     #1-1.맞으면 비밀번호 확인
  #     if params[:password]==params[:password_confirmation]
  #   #1-1-1.비밀번호가 같으면 가입
  #       user=User.create(username:params[:username], email:params[:email],password:params[:password])
  #       flash[:alert]="#{user.username}님 회원가입을 축하합니다"
  #       redirect_to '/'
  #   #1-1-1.비밀번호가 틀리면 비밀번호가 일치하지 않습니다. redirect_to
  #     else
  #       flash[:alert]="비밀번호가 일치하지 않습니다"
  #       redirect_to :back
  #     end
  #   #1-2.틀리면, 이미 가입된 이메일 flash메시지 띄우고, redirect_to :back
  # else
  #   flash[:alert]="가입된 이메일 입니다"
  #   redirect_to :back
  # end
end
end
