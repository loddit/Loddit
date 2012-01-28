class SiteController < ApplicationController
  def index
    @article = Article.new
  end

end
