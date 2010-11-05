class TrendingtopicController < ApplicationController

  def index
    @topics = TrandingTopic.topics
  end

end
