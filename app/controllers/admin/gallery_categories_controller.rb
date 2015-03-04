# -*- encoding : utf-8 -*-
class Admin::GalleryCategoriesController < AdminController
	before_filter :find_category, :only => [:edit, :update, :show, :destroy]

	def index
		@gallery_categories = GalleryCategory.all
	end

	def new
		@gallery_category = GalleryCategory.new
	end

	def create
		@gallery_category = GalleryCategory.new( params[:gallery_category] )
		if @gallery_category.save
			flash[:success] = "Категорія створена успішно"
			redirect_to admin_gallery_categories_path
		else
			flash[:error] = "При створенні Категорії виникли помилки"
			render :action => 'new'
		end
	end

	def update
    @gallery_category.update_attributes(params[:gallery_category])
    if @gallery_category.save
      flash[:success] = "Зміни внесено успішно"
      redirect_to admin_categories_path
    else
      flash[:error] = "Ошибки при внесении изменений"
      render :edit
    end
  end

  def destroy
    @gallery_category.destroy
    flash[:success] = "Категория успешно удалена"
    redirect_to admin_categories_url
  end

	private

	def find_category
		@gallery_category = GalleryCategory.find( params[:id] )
	end
end
