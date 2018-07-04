class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :date_of_birth_aip, :string # bit string for allowed purposes

    add_column :users, :gender, :string
    add_column :users, :gender_aip, :string # bit string for allowed purposes

    add_column :users, :phone_number, :string
    add_column :users, :phone_number_aip, :string # bit string for allowed purposes
  end
end
