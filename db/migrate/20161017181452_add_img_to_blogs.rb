class AddImgToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :blog_img, :string
  end
end
