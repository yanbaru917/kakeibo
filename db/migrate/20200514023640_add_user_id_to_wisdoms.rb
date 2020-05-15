class AddUserIdToWisdoms < ActiveRecord::Migration[5.2]
  def change
    add_column :wisdoms, :user_id, :integer
  end
end
