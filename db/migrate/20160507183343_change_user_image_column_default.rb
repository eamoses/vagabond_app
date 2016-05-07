class ChangeUserImageColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:users, :avatar, 'default_user.png')
  end
end
