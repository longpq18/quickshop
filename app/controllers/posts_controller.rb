class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, except: [:show, :index]

  layout 'layouts/post'

  def index
    @categories = Category.all
    if params[:category].blank?
        @posts = Post.all.order("created_at DESC").limit(6).paginate(:page => params[:page], :per_page => 10)
    else
      @category_id = Category.find_by(name: params[:category]).id   
      @posts = Post.where(:category_id => @category_id).order("created_at DESC").limit(6).paginate(:page => params[:page], :per_page => 10)
    end 
  end

  def tag
    if params[:tag]
        @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
    end   
  end

  def show
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def new
    #@post = Post.new
    @post = current_user.posts.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @post = current_user.posts.build( post_params )
    @post.category_id = params[:category_id]

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.' 
    else
      render 'new' 
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
      @post.category_id = params[:category_id]
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice: 'Post was successfully destroyed.' 
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit( :name, :content, :status, :user_id, :category_id, :image, :tag_list )
    end

    def authorize
      if current_user.nil?
        redirect_to login_url, alert: "Not authorized! Please log in."
      else
        if @post && @post.user != current_user
          redirect_to root_path, alert: "Not authorized! Only #{@post.user} has access to this post."
        end
      end
    end
end
