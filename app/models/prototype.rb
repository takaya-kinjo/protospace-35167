class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :title,       presence: true#, unless: :was_attached?
  validates :catch_copy,  presence: true#, unless: :was_attached?
  validates :concept,     presence: true#, unless: :was_attached?
  validates :image,       presence: true

 # def was_attached?
 #   self.image.attached?
 # end
end
