class CreateHeartRateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :heart_rate_logs do |t|
      t.belongs_to :user, index: true

      t.json :heart_rate
      t.date :date
    end
  end
end
