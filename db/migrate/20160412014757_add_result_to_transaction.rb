class AddResultToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :result, :integer, null: false
  end
end
