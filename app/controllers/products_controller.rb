class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  layout 'layouts/product', only: [:show]
  layout 'layouts/shop', only: [:index]

  def index
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.all.order('created_at DESC')
    end
  end

  def show
    @categories = ProductCategory.all.map{ |c| [c.name, c.id] }
    #@category = ProductCategory.find(params[:id])
    #@recent_posts = @category.products
    if @product.reviews.blank?
      @average_review = 0
    else
      @average_review = @product.reviews.average(:rating).round(2)
    end
  end

  def new
    @product = Product.new
    @categories = ProductCategory.all.map{ |c| [c.name, c.id] }
  end

  def create
    @product = Product.new(product_params)
    @product.product_category_id = params[:product_category_id]

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @categories = ProductCategory.all.map{ |c| [c.name, c.id] }
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :product_image, :detail, :price, :quantum, :note, :product_category_id)
    end
end
