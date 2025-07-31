class DocumentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def extension_allowlist
    %w(pdf doc docx jpg jpeg png txt)
  end
  
  def content_type_allowlist
    [
      'application/pdf',
      'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'image/jpeg',
      'image/png',
      'text/plain'
    ]
  end
  
  def size_range
    1..10.megabytes
  end
  
  def filename
    if original_filename
      @name ||= "#{SecureRandom.uuid}#{File.extname(original_filename)}"
    end
  end
end 