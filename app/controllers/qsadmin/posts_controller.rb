class Qsadmin::PostsController < Qsadmin::BaseController
  before_action :set_qsadmin_post, only: [:show, :edit, :update, :destroy]
  

  def index
    @posts = Qsadmin::Post.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @qsadmin_post = Qsadmin::Post.new
  end

  def edit
  end

  def create
    @qsadmin_post = Qsadmin::Post.new(qsadmin_post_params)

    respond_to do |format|
      if @qsadmin_post.save
        format.html { redirect_to @qsadmin_post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @qsadmin_post }
      else
        format.html { render :new }
        format.json { render json: @qsadmin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @qsadmin_post.update(qsadmin_post_params)
        format.html { redirect_to @qsadmin_post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @qsadmin_post }
      else
        format.html { render :edit }
        format.json { render json: @qsadmin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @qsadmin_post.destroy
    respond_to do |format|
      format.html { redirect_to qsadmin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_qsadmin_post
      @qsadmin_post = Post.find(params[:id])
    end

    def qsadmin_post_params
      params.require(:qsadmin_post).permit( :name, :content, :status, :user_id, :category_id, :image, :tag_list )
    end
end
