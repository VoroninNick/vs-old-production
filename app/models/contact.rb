class Contact < ActionMailer::Base
  
    def contact_us(name, tel, email, text)
      setup_email
      @body[:name]= name
      @body[:tel]= tel
      @body[:email]= email
      @body[:text]  = text
    end

    def subscriber_list(email_list)
      subject  "Підписка на новини студії Миколи Вороніна"
      recipients  email_list
      content_type "text/html"
    end

protected
    def setup_email
      @subject = "Пошта с веб-сайту студії"
      @recipients  = "voronin.nick@gmail.com, office@voroninstudio.eu, support@voroninstudio.eu"
      @from        = "web@voroninstudio.eu"
      @sent_on     = Time.now
    end

end
