class CreateStepDayLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :step_day_logs do |t|
      t.belongs_to :user, index: true

      t.integer :step_count
      t.date :date
    end
  end
end
