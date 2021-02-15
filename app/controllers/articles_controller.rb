class ArticlesController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]  
  before_action :set_article , only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
  end

  def index
    @articles = Article.all
  end

  def new
    # @article = Article.new
    @article = current_user.articles.build
  end

  def edit

  end
 
  def create
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:notice] = "Article was created succesfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Article Updated succesfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy

    @article.destroy
    redirect_to articles_path
  end

  def correct_user
  @article = current_user.articles.find_by(id: params[:id])
  redirect_to articles_path, notice: "Not Authorize to edit this article" if @article.nil?
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :user_id)
  end

end

