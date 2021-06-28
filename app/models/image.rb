class Image < ApplicationRecord
  belongs_to :room
  
  mount_uploader :image_url, ImageUploader
end
