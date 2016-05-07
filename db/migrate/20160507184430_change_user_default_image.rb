class ChangeUserDefaultImage < ActiveRecord::Migration
  def change
    change_column_default(:users, :avatar, 'your_avatar_image.png')
  end
end
