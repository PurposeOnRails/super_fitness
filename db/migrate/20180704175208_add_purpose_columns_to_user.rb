class AddPurposeColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :step_day_logs_aip, :string # bit string for allowed purposes
    add_column :users, :heart_rate_logs_aip, :string # bit string for allowed purposes
  end
end
