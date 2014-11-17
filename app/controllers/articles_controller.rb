class ArticlesController < ApplicationController
	skip_before_filter :authorize
  def index
    @articles=Article.all
  end
  def show
  end
end
