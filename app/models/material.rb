class Material < ActiveRecord::Base
  belongs_to :unit

  def save_file(options={})
    extension = options[:file].original_filename.match(/\.\w{3}/)[0]
    filename = "#{UUIDTools::UUID.timestamp_create().to_s}#{extension}"
    write_path = "#{Rails.root}/public/materials/#{filename}"

    File.open(write_path, 'wb') {|f| f.write options[:file].read}

    self.filename = filename
    self.save
  end
end
