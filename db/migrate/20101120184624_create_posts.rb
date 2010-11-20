class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :twitter_post_id
      t.integer :topic_id
      t.string  :from_user
      t.integer :from_user_id
      t.string  :text

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
