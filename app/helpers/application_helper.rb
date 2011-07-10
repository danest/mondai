module ApplicationHelper
  
  def title
    content_for(:title) { page_title }
  end
  
end
