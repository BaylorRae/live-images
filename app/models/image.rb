class Image < ApplicationRecord
  belongs_to :project

  has_attached_file :image, styles: {
    thumb: "400x300>",
  }
end
