class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
    3.times { @user.emails.build }
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      log_in(@user.name, @user.password)
      redirect_to user_path(@user)
    else
      #REV: Say a user enters an email but no comment body and hits submit.
      #REV: you will re render the :new template, and ask again for the comment.
      #REV: however when you re-render, you will lose the other two blank email fields.
      #REV: So you need to do something before you re-render (to put them back in) like this: 
      #REV: (3-@user.emails.count).times { @user.emails.build }
      #REV: try it with yours if you don't understand...
      render :new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def increment_karma
    @user = User.find_by_id[:id]
    @user.karma += 1
    @user.save
  end
end
