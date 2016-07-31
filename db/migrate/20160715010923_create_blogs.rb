class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :headline
      t.string :teaser
      t.string :content
      t.string :string
      t.integer :author_id
      t.string :datePosted
      t.timestamps null: false
    end
  end
end
