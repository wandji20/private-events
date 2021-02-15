class RemoveUserIdFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :userid, :string

  end
end
