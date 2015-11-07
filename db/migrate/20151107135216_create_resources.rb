class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :designation
      t.string :mark
      t.string :path
      t.text :description
      t.string :rated, null: false, default: 'unrated'

      t.timestamps null: false
    end
  end
end
