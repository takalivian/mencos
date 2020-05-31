class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
    @post.images.new
  end

  def create
    @ppst = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
  end

  def product_params
    params.require(:product).permit(:name, :brand, :shop, :price, :remark, images_attributes: [:url])
  end

end
