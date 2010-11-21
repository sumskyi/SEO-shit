class Topic < ActiveRecord::Base
  has_many :posts
  cattr_reader :per_page
  @@per_page = 100

  def posts_total_pages
    (self.posts.count / self.per_page).ceil
  end

end
