class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true

  validates :director, presence: true

  validates :runtime_in_minutes,  numericality: { only_integer: true }

  validates :description, presence: true

  # validates :poster_image_url, presence: true

  mount_uploader :local_image_url, MovieImageUploader

  validates :release_date, presence: true

  validate :release_date_is_in_the_future

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size > 0
  end

  def self.search(title=nil, director=nil)
    where("title like ? OR director like ?", "#{title}", "#{director}")
  end


  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should not be in the future") if release_date > Date.today
    end   
  end

end
