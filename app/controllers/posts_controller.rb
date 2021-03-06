class PostsController < ApplicationController
  before_action :authorize ,except:[:index]


  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(user_id: current_user.id,
                title: params[:title],
                content: params[:content]
    )
    flash[:notice]="successfully written"
    # post = Post.new
    # post.username = params[:username]
    # post.title = params[:title]
    # post.content = params[:content]
    # post.save
    redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(user_id: current_user.id,
                title: params[:title],
                content: params[:content])
    redirect_to "/posts/#{post.id}"
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
end
