class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def new
    @comment = Comment.new #REV: not clear what you're doing here. doesn't a post have comments?
    @comment.comments.build
    @user = current_user
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user

    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to user_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    redirect_to root_path
  end

end
