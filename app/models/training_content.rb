class TrainingContent < ActiveRecord::Base
  belongs_to :trainer
  mount_uploader :image, ImageUploader
  
  validates :name, presence: true
  validates :content, presence: true
  validates :sports_type, presence: true
  
end

