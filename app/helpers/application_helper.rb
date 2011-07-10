module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title || "Binghamton University Question Your Campus" }
  end
  
end
