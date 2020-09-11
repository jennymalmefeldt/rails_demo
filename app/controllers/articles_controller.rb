class ArticlesController < ApplicationController
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
    @article = Article.create(params.require(:article).permit(:title, :content))
    if @article.persisted?
      redirect_to root_path, notice: 'Your article was successfully created'
    else
      redrirect_to new_article_path, notice: 'Error, try again'
    end
  end

  def edit
    @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])
  if @article.update(params.require(:article).permit(:title, :content))
    redirect_to @article, notice: 'Your article was successfully updated'
  else
    redirect_to edit_article_path, notice: 'Error, try again'
    end
  end
end

