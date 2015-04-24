class AddConnectionIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :connection_id, :integer
  end
end
