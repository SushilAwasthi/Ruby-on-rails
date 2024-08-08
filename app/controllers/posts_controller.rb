class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  # http_basic_authenticate_with name:"sushil" ,password:"123", except: [:index , :show]
  before_action :correct_user, only: [ :edit, :destroy, :update ]

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
      unless @post
      flash[:notice] = "you are not authorized to perform this action."
      redirect_to root_path
      end
  end
  def index
    @posts = Post.all
  end
   def new
   @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end
  private
  def post_params
    params.require(:post).permit(:title, :description, :status, :user_id)
  end
end
