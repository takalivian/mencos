class Image < ApplicationRecord

  mount_uploader :url, ImageUploader
  belongs_to :post, optional: true

end
