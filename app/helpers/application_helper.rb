module ApplicationHelper
  def main_title
    'Horticulture With Ms. H. at Monroe High School, Monroe, WA'
  end

  def main_nav_link(name, url)
    content_tag :li, :class => main_nav_link_class(url) do 
      link_to "#{name}", url
    end
  end

  private

  def main_nav_link_class(url)
    'active' if request.path == url
  end
end
