module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title}
  end
  
  def yield_or_default(section, default = "") 
      content_for?(section) ? yield(section) : default 
  end
  
end
