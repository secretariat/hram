# -*- encoding : utf-8 -*-
class GalleryCategory < ActiveRecord::Base
  attr_accessible :active, :name
  scope :active, where( :active => true )
end
