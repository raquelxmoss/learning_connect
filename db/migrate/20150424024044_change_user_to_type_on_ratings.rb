class ChangeUserToTypeOnRatings < ActiveRecord::Migration
  def up

    remove_column :ratings, :user_id
    add_column :ratings, :type, :string

  end

  def down
    add_column :ratings, :user_id, :integer
    remove_column :ratings, :type
  end
end
