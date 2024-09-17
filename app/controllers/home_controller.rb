class HomeController < ApplicationController
  def index
    @pages = Page.published.ordered
    # @pages = Page.ordered
  end
end
