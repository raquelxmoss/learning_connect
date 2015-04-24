class AddConnectionToCourse < ActiveRecord::Migration
  def up

    add_column :courses, :connection_id, :integer

  end

  def down

    remove_column :courses, :connection_id

  end
end
