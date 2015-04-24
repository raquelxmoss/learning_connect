class ChangeNameTypeToRatingTypeOnRatings < ActiveRecord::Migration
  def change

    rename_column :ratings, :type, :rating_type
  end
end
