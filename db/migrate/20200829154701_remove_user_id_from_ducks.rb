class RemoveUserIdFromDucks < ActiveRecord::Migration[5.2]
  def change
    remove_column :ducks, :user_id, :integer
  end
end
