class ArticlesController < ApplicationController

  before_filter :set_current
  caches_page :index, :show, :tagged_with

  def index
      @title = "Анонси та події. - Дизайн студія Миколи Вороніна (Львів).Графічний дизайн. Створення веб-сайтів. Поліграфія."
      @articles = Article.find(:all, :conditions => "publish", :order => "updated_at DESC")
      add_crumb "Анонси та події"
  end

  def tagged_with
    @tag = params[:tag]
    @articles = Article.tagged_with(@tag, :on => :artags, :order => "created_at DESC").reject {|w| !w.publish}
    add_crumb "Анонси та події", articles_path
    add_crumb @tag
    @title = "Анонси та події за тегом - #{@tag}. - Дизайн студія Миколи Вороніна (Львів).Графічний дизайн. Створення веб-сайтів. Поліграфія."
    render :action => "index"
  end

  def show
    @article = Article.find(params[:id], :conditions => "publish")

    add_crumb "Анонси та події", articles_path
    add_crumb @article.name
    @title = "#{@article.name}. Дизайн студія Миколи Вороніна (Львів)."
  end

  private

  def set_current
    @is_articles = "current"
  end

  
end
