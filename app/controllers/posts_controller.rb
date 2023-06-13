class PostsController < ApplicationController
  # The index method is responsible for fetching and displaying a list of posts belonging to a specific user
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  # The show method displays only further details on a single post and user
  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  # The new method lets Rails know that you will create a new object
  def new
    @post = @current_user.posts.new
  end

  # It starts by finding the User object based on the user_id parameter
  # Then, it creates a new Post object associated with that user

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_posts_path(@user)
        else
          render :new, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
