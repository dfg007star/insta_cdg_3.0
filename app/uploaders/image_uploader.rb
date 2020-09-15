class ImageUploader < Shrine
  # plugins and uploading logic
  plugin :default_url
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_extension %w[jpg jpeg png webp]
  end

  Attacher.default_url do |**_options|
    '/placeholders/missing.jpg'
  end
end
