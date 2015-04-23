class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.text :description
      t.belongs_to :connection
      t.belongs_to :course
      t.integer :price
      t.string :location

      t.timestamps null: false
    end
  end
end
