class CreateAccessCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :access_codes do |t|
      t.string :description
      t.string :code
      t.references :purpose

      t.timestamps
    end
  end
end
