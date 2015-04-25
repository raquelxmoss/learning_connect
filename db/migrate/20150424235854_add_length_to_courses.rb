class AddLengthToCourses < ActiveRecord::Migration
  def up
    add_column :courses, :length, :integer
  end

  def down
    remove_column :courses, :length
  end
end
