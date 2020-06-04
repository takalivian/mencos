class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at desc").limit(20)
  end

  def new
    @post = Post.new
    @post.images.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      redirect_to new_post_path
    end
  end
  
  def show
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def post_params
    params.require(:post).permit(:name, :category_id, :brand, :shop, :praice, :remark, images_attributes: [:_destroy,:id,:url]).merge(user_id: current_user.id)
  end

end
