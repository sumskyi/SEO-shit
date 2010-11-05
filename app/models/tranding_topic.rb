require 'twitter'
require 'twitter/trends'

class TrandingTopic

  class << self
    def names
      @names ||= Twitter::Trends.current.collect{|el| {:name => el.name, :query => el.query}}
    end

    def posts
      @posts = {}
      @names.each do |name|
        puts name[:query]
        @posts[name[:query].to_sym] = Twitter::Search.new(name[:query]).fetch().results
      end
      @posts
    end

  end

end
