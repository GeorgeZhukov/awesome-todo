FactoryGirl.define do
  factory :attached_file do
    comment
    attachment { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'example_image.jpg')) }
  end

end
