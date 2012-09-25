class Material < ActiveRecord::Base
  belongs_to :unit

  default_scope order("sort asc")

  def save_file(options={})
    extension = options[:file].original_filename.match(/\.\w{3}/)[0]
    filename = "#{UUIDTools::UUID.timestamp_create().to_s}#{extension}"
    write_path = "#{Rails.root}/public/materials/#{filename}"

    File.open(write_path, 'wb') {|f| f.write options[:file].read}

    self.filename = filename
    self.save
  end

  def download_path(class_path)
    "/classes/#{class_path}/files/#{self.name_url}#{self.extension}"
  end

  def name_url
    self.name.gsub(' ','-')
  end

  def extension
    self.filename.match(/\.\w{3}/)[0]
  end

  def delete_file
    File.delete("#{Rails.root}/public/materials/#{filename}")
  end
end
