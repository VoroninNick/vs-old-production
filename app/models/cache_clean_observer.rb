class CacheCleanObserver < ActiveRecord::Observer
  observe :about, :article, :vacansy, :work, :frase

def after_save(record)
  sweep_cache_data
end

def after_destroy(record)
  sweep_cache_data
end

def sweep_cache_data
  cache_dir = ActionController::Base.page_cache_directory
  FileUtils.rm_r(Dir.glob(cache_dir+"/*")) rescue Errno::ENOENT
end
end
