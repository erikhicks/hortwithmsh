module MaterialsHelper
  def helper_linked_name(material)
    return link_to material.name, get_valid_url(material.url) if !material.url.to_s.empty?
    return material.name
  end

  def get_valid_url(url)
    valid_protocols = [
      'http://',
      'ftp://',
      'https://'
    ]

    valid_protocols.each do |protocol|
      return url if url.include?(protocol)
    end

    return 'http://' + url;
  end
end
