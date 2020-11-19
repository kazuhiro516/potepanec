module ApplicationHelper
  def full_title(page_title='')
    base_title = 'BIGBAG'
    if page_title.nil?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
