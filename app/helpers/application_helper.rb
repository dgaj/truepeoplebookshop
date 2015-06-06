module ApplicationHelper

def cp(path)
  "active" if current_page?(path)
end

# Returns the full title on a per-page basis.
def full_title(page_title = '')
  base_title = "template"
  if page_title.empty?
    base_title
  else
    "#{page_title} - #{base_title}"
  end
end

end
