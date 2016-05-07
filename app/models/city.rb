class City < ActiveRecord::Base
  has_many :posts

  extend FriendlyId
  friendly_id :name, use: :slugged

  # def to_param
  #   "#{id} #{name}".parameterize
  # end
end
