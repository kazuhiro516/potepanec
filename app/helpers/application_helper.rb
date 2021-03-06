module ApplicationHelper
  BASE_TITLE = 'BIGBAG'.freeze

  def full_title(page_title)
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end

  def heading_title(page_heading)
    page_heading&.include?("/") ? page_heading.split("/") : [page_heading]
  end
end
