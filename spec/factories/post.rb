FactoryBot.define do 
factory :post do
  association :user

  image { Rack::Test::UploadedFile.new(Rails.root.join('spec/files/test.jpg')) }
  description { "description" }

  trait (:with_invalid_image) do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/files/test.txt')) }
  end
end
end