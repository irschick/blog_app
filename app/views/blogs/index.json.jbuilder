json.array!(@blogs) do |blog|
  json.extract! blog, :id, :headline, :teaser, :content, :author_id, :datePosted, :blog_img
  json.url blog_url(blog, format: :json)
end
