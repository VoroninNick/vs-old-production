# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def frase
    frase = Frase.find(:first, :order => "rand()");
    if frase
      html = "#{frase.description}"
      html << "<p class='author'>#{frase.author}</p>"
      return html
    else
      return nil
    end
  end

end
