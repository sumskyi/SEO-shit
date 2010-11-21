class Post < ActiveRecord::Base
  belongs_to :topic
  cattr_reader :per_page
  @@per_page = 100
end
