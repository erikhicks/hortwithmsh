module ApplicationHelper
  def main_title
    'Horticulture With Ms. H. at Monroe High School, Monroe, WA'
  end

  def nav_link(name, url)
    content_tag :li, :class => nav_link_class(url) do 
      link_to "#{name}", "/#{url}/"
    end
  end

  private

  def nav_link_class(url)
    'active' if params[:action] == url
  end
end
