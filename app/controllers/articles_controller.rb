class ArticlesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user == current_user
      @article.destroy
      @article.comments.destroy_all
      redirect_to articles_path, status: :see_other
    else
      redirect_to @article, notice: "You can't delete this article"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :body)
  end
end
