ActionController::Routing::Routes.draw do |map|

  map.sitemap "sitemap", :controller => "main", :action => "sitemap"
  map.resources :vacansies
  map.resources :articles
  map.about "/about", :controller=>"main", :action=>"about"
  map.services "/services", :controller=>"main", :action=>"services"
  map.vactagged "vacansies/tagged/:tag", :controller=>"vacansies", :action=>"tagged_with"
  map.artagged "articles/tagged/:tag", :controller=>"articles", :action=>"tagged_with"
  map.tagged "works/:category/tag/:tag", :controller=>"works", :action=>"tagged_with", :category => /logo|print|web/, :tag => nil
  map.connect "works/:category/tag/:tag/page/:page", :controller=>"works", :action=>"tagged_with", :category => /logo|print|web/, :tag => nil
  map.logo "logo", :controller => "works", :action => "logo", :path_prefix => "works"
  map.connect "logo/page/:page", :controller => "works", :action => "logo", :path_prefix => "works"
  map.print "print", :controller => "works", :action => "print", :path_prefix => "works"
  map.connect "print/page/:page", :controller => "works", :action => "print", :path_prefix => "works"
  map.web "web", :controller => "works", :action => "web", :path_prefix => "works"
  map.connect "web/page/:page", :controller => "works", :action => "web", :path_prefix => "works"
  map.portfolio "works", :controller => "works", :action => "index"
  map.resources :works, :as => 'works/:category'
  map.contact "contact", :controller => "main", :action => "contact"
  map.home "", :controller => "main", :action => "index"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
