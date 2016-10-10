class Comment < ActiveRecord::Base
  # -------  Create cross references to other models
  belongs_to :user
  belongs_to :blog
  # -------  comments must have these attributes
  validates :body, presence: true
  validates :user, presence: true
  validates :blog, presence: true
  validates :rating, numericality: { only_integer: true }
  # ------- display ratings in order
  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
  # ------- helper method
  def how_many_days_ago
    current_date = DateTime.now
    comment_date = created_at
    return (current_date.to_date - comment_date.to_date).to_i
  end

  def bad_record?
    if user.nil?
      return true
    end
    if user_id.nil?
      return true
    end
    if body.nil?
      return true
    end
    if rating.nil?
      return true
    end
    return false
  end

end
