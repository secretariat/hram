# -*- encoding : utf-8 -*-
class CreateGalleryCategories < ActiveRecord::Migration
  def change
    create_table :gallery_categories do |t|
      t.string :name, :limit => 60
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
