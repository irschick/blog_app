json.array!(@blogs) do |blog|
  json.extract! blog, :id, :headline, :teaser, :content, :string, :author_id, :datePosted
  json.url blog_url(blog, format: :json)
end