class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :picture
      t.boolean :is_admin

      t.timestamps
    end
  end
end
