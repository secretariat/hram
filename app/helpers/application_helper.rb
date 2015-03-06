# -*- encoding : utf-8 -*-
module ApplicationHelper
	def bool2str( bool )
    bool ? "Так" : "Ні"
  end

	def meta_data(obj)
    title obj.title
    meta_d obj.meta_d
    meta_k obj.meta_k
  end

  def meta_d(meta_d)
    @meta_description = meta_d
  end

  def meta_k(meta_k)
    @meta_keywords = meta_k
  end

  def title(title)
    @meta_title = title
  end
end
