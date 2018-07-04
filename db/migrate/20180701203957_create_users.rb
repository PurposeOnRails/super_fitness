class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :name_aip # bit string for allowed purposes
      t.string :email
      t.string :email_aip # bit string for allowed purposes
      t.index :email, unique: true

      t.string :password_digest

      t.timestamps
    end
  end
end
