module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Expat CPA | American Expatriate Tax Services"
    if page_title.empty?
      base_title
    else
      "#{page_title}"
    end
  end

end
