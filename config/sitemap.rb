# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://voroninstudio.eu"
SitemapGenerator::Sitemap.yahoo_app_id = false
SitemapGenerator::Sitemap.add_links do |sitemap|
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: sitemap.add path, options
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly', 
  #           :lastmod => Time.now, :host => default_host

  
  # Examples:
  
  # add '/articles'
  sitemap.add articles_path, :priority => 0.7, :changefreq => 'weekly'
  sitemap.add vacansies_path, :priority => 0.7, :changefreq => 'weekly'

  # add all individual articles
  Article.find(:all).each do |a|
    sitemap.add article_path(a), :lastmod => a.updated_at
  end

  # add all individual articles
  Vacansy.find(:all).each do |a|
    sitemap.add vacansy_path(a), :lastmod => a.updated_at
  end

  # add all individual works
  Work.find(:all).each do |w|
    sitemap.add work_path(w.category, w), :lastmod => w.updated_at
  end

  # add merchant path
  sitemap.add '/about', :priority => 0.7
  sitemap.add '/services', :priority => 0.7
  sitemap.add '/contact', :priority => 0.7
  sitemap.add '/portfolio', :priority => 0.7
  
end
