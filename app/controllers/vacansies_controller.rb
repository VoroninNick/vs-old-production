class VacansiesController < ApplicationController
  before_filter :set_current
  caches_page :index, :show, :tagged_with

  def index
      @title = "Вакансії. - Дизайн студія Миколи Вороніна (Львів).Графічний дизайн. Створення веб-сайтів. Поліграфія."
      @vacansies = Vacansy.find(:all, :conditions => "publish", :order => "updated_at DESC")
      add_crumb "Вакансії"
  end

  def tagged_with
    @tag = params[:tag]
    @vacansies = Vacansy.tagged_with(@tag, :on => :vactags, :order => "created_at DESC").reject {|w| !w.publish}
    add_crumb "Вакансії", vacansies_path
    add_crumb @tag
    @title = "Вакансії за тегом - #{@tag}. - Дизайн студія Миколи Вороніна (Львів).Графічний дизайн. Створення веб-сайтів. Поліграфія."
    render :action => "index"
  end

  def show
    @vacansy = Vacansy.find(params[:id], :conditions => "publish")
    
    add_crumb "Вакансії", vacansies_path
    add_crumb @vacansy.name
    @title = "#{@vacansy.name}. - Дизайн студія Миколи Вороніна (Львів).Графічний дизайн. Створення веб-сайтів. Поліграфія."
  end

  private

  def set_current
    @is_vacansies = "current"
  end

end
