class MainController < ApplicationController
  caches_page :index, :portfolio, :services, :about, :sitemap
  
  def index
  end

  def contact
    @is_contact = "current"
    add_crumb "контакти"
    @title = "Контакти - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
    if request.post?
      if params[:email].empty? || params[:text].empty?
        flash[:notice] = "Поля email та текст повідомлення є обов'язковими для заповнення."
        redirect_to contact_url
      else
      Contact.deliver_contact_us(params[:name], params[:tel], params[:email], params[:text])
      flash[:notice] = "Лист відправлено успішно."
      end
    end
  end

  def services
    @is_services = "current"
    add_crumb "наші послуги"
    @title = "Наші послуги - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
  end

  def about
    @is_about = "current"
    add_crumb "про нас"
    @about = About.find(:first)
    @title = "Про нас - Дизайн студія Миколи Вороніна (Львів). Графічний дизайн. Створення веб-сайтів. Поліграфія."
  end

  def sitemap
    add_crumb "Карта сайту"
    @web_tags = Work.web.inject("") {|tags, o| tags + o.tag_list.to_s + ","}.split(",").map {|o| o.strip}.uniq.flatten
    @print_tags = Work.print.inject("") {|tags, o| tags + o.tag_list.to_s + ","}.split(",").map {|o| o.strip}.uniq.flatten
    @logo_tags = Work.logo.inject("") {|tags, o| tags + o.tag_list.to_s + ","}.split(",").map {|o| o.strip}.uniq.flatten
  end

  
end
