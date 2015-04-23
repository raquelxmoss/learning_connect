class AddStatusToCourses < ActiveRecord::Migration
  def up

    add_column :courses, :status, :string, default: "pending"

  end

  def down
    remove_column :courses, :status
  end
end
