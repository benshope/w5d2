class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
    @post.comments.build #REV: so you build comments for comment and post? (RE: my comment on  your post controller.)
    @user = current_user #REV: I see how this works, but think it should be one way OR the other.
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
