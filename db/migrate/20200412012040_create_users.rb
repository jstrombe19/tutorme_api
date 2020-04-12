class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.integer :phone
      t.boolean :tutor
      t.text :experience
      t.string :password_digest

      t.timestamps
    end
  end
end
