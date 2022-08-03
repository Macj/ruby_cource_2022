class NewsController < ApplicationController
  def list
    @list = NewPost.all
  end
end