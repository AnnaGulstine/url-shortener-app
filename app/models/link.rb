class Link < ActiveRecord::Base
  belongs_to :user
  has_many :visits

  validates :slug, presence: true
  validates :target_url, presence: true

  def standardize_target_url!
    target_url.gsub!("http://", "")
    target_url.gsub!("https://", "")
  end

  def visit_count
    visits.count
  end

  def slug_generator
    random_array = [('0'..'9')].map{ |i| i.to_a }
    numbers = random_array.flatten
    numbers_array = []
    5.times do
      numbers_array << numbers.sample
    end
  end
end
