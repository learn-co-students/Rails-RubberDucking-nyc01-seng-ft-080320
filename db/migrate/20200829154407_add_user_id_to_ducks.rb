class AddUserIdToDucks < ActiveRecord::Migration[5.2]
  def change
    add_column :ducks, :user_id, :integer
  end
end
