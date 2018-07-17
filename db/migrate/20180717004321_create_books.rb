class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.string :image, default: "not_available.png"
      t.references :author, foreign_key: true
    end
  end
end
