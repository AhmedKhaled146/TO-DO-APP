class Createtodo < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.integer :count
      t.string :title
      t.string :description
      t.boolean :active, default: false
    end
  end
end
