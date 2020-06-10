class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at desc").limit(4)
    @all_ranks = User.find(Relationship.group(:follow_id).order('count(follow_id) desc').limit(5).pluck(:follow_id))
  end

  def new
    @post = Post.new
    @post.images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      redirect_to new_post_path
    end
  end
  
  def show
    @post = Post.includes(:images).find(params[:id])
    unless @post.user.age.blank?
      @user_age = Agehash.find(@post.user.age)
    end
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def category
    @categories = Category.where(ancestry: nil)
    @category = Category.find_by(id: params[:id])

    @child = @category.children
    if @category.ancestry == nil
      @posts = Post.where(category_id: @child)
      @posts_number = Post.where(category_id: @child).count
    else
      @posts = Post.where(category_id: @category)
      @posts_number = Post.where(category_id: @category).count
    end

  end

  private

  def post_params
    params.require(:post).permit(:name, :category_id, :brand, :shop, :praice, :star, :remark, images_attributes: [:_destroy,:id,:url]).merge(user_id: current_user.id)
  end

end
