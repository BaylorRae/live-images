class Image < ApplicationRecord
  belongs_to :project

  has_attached_file :image, styles: { thumb: "400x300>", }
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]

  def self.latest
    order(created_at: :desc).first
  end
end
