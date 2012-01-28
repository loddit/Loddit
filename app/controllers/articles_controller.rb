class ArticlesController < ApplicationController
respond_to :json,:html

  def index
    @articles = Article.all
    @article = Article.new
    respond_with @articles do |format|
      format.html { render "/site/index"}
    end
  end

  def show 
    @article = Article.find(params[:id])
    respond_with @article
  end

  def create
    @article = Article.new(params[:article])
    @article.save
    respond_with @article
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with @article
  end

  def destroy
    @article = Article.find(params[:id]).destroy
    respond_with @article
  end
end
