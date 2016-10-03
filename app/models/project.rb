class Project < ApplicationRecord
  has_many :images

  validates :title, presence: true, uniqueness: true
end
