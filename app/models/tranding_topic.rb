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
  end

end

