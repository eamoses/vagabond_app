class Post < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :city
  belongs_to :user

  validates :title,
              presence:   true,
              length:   { minimum: 1, maximum: 200 }

  validates :content,
              presence:   true

  def self.confirm(params)
    @post = Post.find_by({id: params[:id]})
  end
end
