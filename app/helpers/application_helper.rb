module ApplicationHelper

  def thumbnail(thumbnail)
    content_tag(:img, nil, 
      class: 'lazy',
      src: thumbnail.url,
      'data-original': thumbnail.url,
      width: thumbnail.width,
      height: thumbnail.height,
      alt: "Thumbnail image"
    )
  end

  def format_date(date)
    "<span title=\"#{date.to_formatted_s(:long_ordinal)}\">#{time_ago_in_words(date)} ago</span>".html_safe
  end
end
