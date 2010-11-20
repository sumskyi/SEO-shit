require 'twitter'
require 'twitter/trends'

class TrandingTopic < Twitter::Trends

  attr_accessor :name

  def initialize(name, query)
    @name   = name
    @query  = query
  end

  def posts
    @posts ||= Twitter::Search.new(@query).fetch().results
  end

  class << self
    def topics
      @topics ||= current.collect{|el| new(el.name, el.query)}
    end

    def refresh
      topics.each do |topic|
        local_topic = Topic.find_by_name(topic.name)
        local_topic = Topic.create({ :name => topic.name }) unless local_topic

        topic.posts.each do |post|
          next if Post.find_by_twitter_post_id(post.id)
          local_topic.posts << Post.new({
            :twitter_post_id  => post.id,
            :from_user        => post.from_user,
            :from_user_id     => post.from_user_id,
            :text             => post.text
          })
        end
      end
    end
  end

end

