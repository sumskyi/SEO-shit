module Sitemap
  extend self

  APP_URL = 'http://trendsnapz.com/'

  def xml
    xml = Builder::XmlMarkup.new(:indent => 4)
    xml.instruct!
    xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
      Topic.find_in_batches(:batch_size => 10) do |topics|
        topics.each do |topic|
          #puts topic.posts_total_pages
          (0...topic.posts_total_pages).each do |page|
            #puts page
            xml.url do
              xml.loc     "#{APP_URL}topics/#{URI.escape topic.name}/#{page+1}"
              xml.lastmod topic.posts[(page-1)*topic.per_page].updated_at.iso8601
            end
          end
        end
      end
    end
  end

  def rebuild
    File.open(sitemap_path, 'w') do |file|
      file.puts xml
    end
  end

private


  def sitemap_path
    "#{RAILS_ROOT}/public/sitemap.xml"
  end

end
