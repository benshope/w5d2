class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
    @post.comments.build
    @user = current_user
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(params[:post])
    #REV: You can cut this down to just 'redirect_to @post'
      redirect_to user_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to root_path
  end

end
