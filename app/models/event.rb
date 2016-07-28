class Event < ActiveRecord::Base
  mount_uploader :main_image, ImageUploader
  has_many :participations
end
