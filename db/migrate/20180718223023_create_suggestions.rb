class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :author
      t.string :title
      t.integer :rating
      t.text :comment
      t.references :user, foreign_key: true
    end
  end
end
