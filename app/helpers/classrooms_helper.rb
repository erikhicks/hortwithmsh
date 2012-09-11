module ClassroomsHelper
  def nav_link(name, path)
    isActive = request.path.include?(path)
    className = isActive ? 'active' : ''
    content_tag(:li, :class => className) do
      link_to name, path
    end
  end
end
