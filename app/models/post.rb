class Post < ApplicationRecord
    include ImageUploader::Attachment(:image)
    belongs_to :user
    has_many :comments, dependent: :destroy
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :image, presence: true
    validates :description, presence: true, length: { maximum: 140 }
end
