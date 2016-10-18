class Blog < ActiveRecord::Base
  # validates :name, presence: true

  belongs_to :user
  has_many :comments
  #
  # def blog_img
  #   return "http://www.patagonia.com/dis/dw/image/v2/ABBM_PRD/on/demandware.static/-/Sites-patagonia-master/default/dwf4d4ab65/images/hi-res/25455_MOTW_OM2.jpg?sw=750&sh=750&sm=fit&sfrm=png"
  # end

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
