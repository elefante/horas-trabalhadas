class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.logon(params[:login], params[:password])
    if @user
      session[:user_id] = @user.id
      destiny = session[:return_to] || root_path
      redirect_to destiny
    else 
      flash[:notice] = "O login falhou, verifique o nome de usuário e senha informados"
      render :action => "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
