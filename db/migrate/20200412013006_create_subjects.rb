class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :category
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
