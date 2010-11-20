class TrendingtopicController < ApplicationController

  def index
    @topics = TrandingTopic.topics
  end
  def show; end
end

