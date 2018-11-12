class HomeController < ApplicationController
  def show
    render template: "home/index.html"
  end
end
