module WorksHelper

  def link_to_previous
    html = @previous.nil? ? "<span class=\"detail\"><<</span>" : link_to("<<", work_path(@previous.category, @previous), :title=>"Попередня", :class=>"detail prev", :id=>"lprev")
    return html
  end

  def link_to_next
    html = @next.nil? ? "<span class=\"detail\">>></span>" : link_to(">>", work_path(@next.category, @next), :title=>"Наступна", :class=>"detail next", :id=>"lnext")
    return html
  end

end
