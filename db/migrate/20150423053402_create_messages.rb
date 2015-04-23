class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.belongs_to :connection

      t.timestamps null: false
    end
  end
end
