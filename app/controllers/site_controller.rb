class SiteController < ApplicationController
  def index
    @article = Article.new
    @articles = Article.all
  end

end
