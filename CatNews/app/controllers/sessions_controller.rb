class SessionsController < ApplicationController
  def create
    if log_in(params[:session][:name], params[:session][:password])
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def new
  end
end
