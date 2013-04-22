class Product < ActiveRecord::Base
  attr_accessible :description, :image, :title
  has_attached_file :image, :styles => { :thumb => "100x100>" }

  def image_path
    image.url
  end
end
