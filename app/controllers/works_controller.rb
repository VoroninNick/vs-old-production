class WorksController < ApplicationController
  
  before_filter :set_current
  caches_page :show, :index
  ARRAY = {"logo" => "Фірмові стилі", "print" => "Поліграфія", "web" => "Веб"}.freeze

  def index
    @is_portfolio = "current"
    add_crumb "портофоліо"
    @title = "Портфоліо - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
  end

  def show
    @work = Work.find(params[:id], :conditions => "publish")
    @previous = Work.find(:first, :conditions => ["id < ? and category = '#{@work.category}' and publish", @work.id], :order => "id DESC")
    @next = Work.find(:first, :conditions => ["id > ? and category = '#{@work.category}' and publish", @work.id])
    @also = Work.find(:all, :conditions => ["LOWER(customer) = ? and id != ? and publish", @work.customer.downcase, @work.id], :order=>"rand()").first(2)
    add_crumb "Портфоліо", portfolio_url
    case @work.category
      when "logo" then add_crumb "Фірмові стилі", logo_path
      when "print" then add_crumb "Поліграфія", print_path
      when "web" then add_crumb "Веб", web_path
    end
    add_crumb @work.name
    @title = "#{ARRAY[@work.category]} - #{@work.name}. Дизайн студія Миколи Вороніна (Львів)."
  end

  def tagged_with
    respond_to do |wants|

    wants.html do
    @tag = ARRAY[params[:category]]
    @works = Work.send(params[:category]).tagged_with(params[:tag], :on => :tags, :order => "position").paginate(:page => params[:page], :per_page => 9)
    @tags = Work.send(params[:category]).inject("") {|tags, o| tags + o.tag_list.to_s + ","}.split(",").map {|o| o.strip}.uniq.flatten
    @page = params[:page] || 1
    
    add_crumb "Портфоліо", portfolio_url
    add_crumb @tag
    @title = "#{params[:tag]} - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
    @keywords = "фірмові стилі, корпоративні скерування,  логотипи, фірмовий стиль, поліграфія, афіша, флаєр, реклама, веб, сайти, програмування, дизайн студія, Львів, дизайн студія у Львові"
    end
    
    wants.js do
      # determine contact that was last
        @last = params[:last].to_i
        @page = @last + 1
        @works = Work.send(params[:category]).tagged_with(params[:tag], :on => :tags, :order => "position").paginate(:page => @page, :per_page => 9)

        if @works.empty?
          render :partial => 'partials/complete'
        else
          render :partial => 'partials/items', :collection => @works, :locals => {:page => @page}
        end

    end
    
    end
 end

  def logo
    respond_to do |wants|

    wants.html do
    @works = Work.logo.paginate(:page => params[:page], :per_page => 9)
    @tags = Work.logo.inject("") {|tags, o| tags + o.tag_list.to_s + ","}.split(",").map {|o| o.strip}.uniq.flatten
    @page = params[:page] || 1

    @tag = "Фірмові стилі"
    add_crumb "Портфоліо", portfolio_url
    add_crumb "Фірмові стилі"
    @title = "Портфоліо / Фірмовий стиль - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
    @keywords = "фірмові стилі, фірмовий стиль, логотипи, придумали назву, корпоративні скерування, дизайн студія, Львів, дизайн студія у Львові, Микола Воронін"
    render :action => "tagged_with"
    end

    wants.js do
      # determine contact that was last
        @last = params[:last].to_i
        @page = @last + 1
        @works = Work.logo.paginate(:page => @page, :per_page => 9)

        if @works.empty?
          render :partial => 'partials/complete'
        else
          render :partial => 'partials/items', :collection => @works, :locals => {:page => @page}
        end

    end

    end
  end

  def print

    respond_to do |wants|

    wants.html do
    @works = Work.print.paginate(:page => params[:page], :per_page => 9)
    @tag = "Поліграфія"
    @tags = Work.print.inject("") {|tags, o| tags + o.tag_list.to_s + ","}.split(",").map {|o| o.strip}.uniq.flatten
    @page = params[:page] || 1
    
    add_crumb "Портфоліо", portfolio_url
    add_crumb "Поліграфія"
    @title = " Портфоліо /  Поліграфія   - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
    @keywords = "поліграфія, афіша, флаєр, реклама, дизайн студія, Львів, дизайн студія у Львові, Львів, Микола Воронін"
    render :action => "tagged_with"
    end

    wants.js do
      # determine contact that was last
        @last = params[:last].to_i
        @page = @last + 1
        @works = Work.print.paginate(:page => @page, :per_page => 9)

        if @works.empty?
          render :partial => 'partials/complete'
        else
          render :partial => 'partials/items', :collection => @works, :locals => {:page => @page}
        end

    end

    end
  end

  def web
    respond_to do |wants|

    wants.html do
    @works = Work.web.paginate(:page => params[:page], :per_page => 9)
    @tag = "Веб"
    @tags = Work.web.inject("") {|tags, o| tags + o.tag_list.to_s + ","}.split(",").map {|o| o.strip}.uniq.flatten
    @page = params[:page] || 1

    add_crumb "Портфоліо", portfolio_url
    add_crumb "Веб"
    @title = "Портфоліо /   Веб-сайт  - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
    @keywords = "веб, сайти, веб-сайт, web, програмування дизайн студія, Львів, дизайн студія у Львові, Микола Воронін"
    render :action => "tagged_with"
    end

    wants.js do
      # determine contact that was last
        @last = params[:last].to_i
        @page = @last + 1
        @works = Work.web.paginate(:page => @page, :per_page => 9)

        if @works.empty?
          render :partial => 'partials/complete'
        else
          render :partial => 'partials/items', :collection => @works, :locals => {:page => @page}
        end

    end

    end
  end

  private

  def set_current
    @is_portfolio = "current"
  end

end
