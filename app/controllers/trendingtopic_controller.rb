class TrendingtopicController < ApplicationController
  before_filter :search_topic

  def index
    @topics = Topic.paginate(:page => params[:page], :order => 'created_at DESC')
  end

  def show; end

private

  def search_topic
    @topic = Topic.find_by_name(params[:topic])
    @posts = @topic.posts.paginate(:page => params[:page], :order => 'created_at DESC') if @topic
  end

end

