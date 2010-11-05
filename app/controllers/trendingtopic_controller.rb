class TrendingtopicController < ApplicationController

  def index
    @names = TrandingTopic.names
    @posts = TrandingTopic.posts
  end

end
