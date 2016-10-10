class Blog < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  has_many :comments

  def first_rating
    comments.first.rating
  end

  def highest_rating_comment
    # if comments.size == 0
    #   return ''
    # end
    return comments.rating_desc.first
  end

  def lowest_rating_comment
    # if comments.size == 0
    #   return ''
    # end
    return comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def list_comments
    return comments
  end

  def highest_rating_comment_rating
    highest_rating_comment.rating
  end

  def lowest_rating_comment_rating
    lowest_rating_comment.rating
  end

end
