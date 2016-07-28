class Event < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader
  has_many :participations
  has_many :participating_users, through: :participations, source: :user
end
