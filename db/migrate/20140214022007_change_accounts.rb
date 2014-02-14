class ChangeAccounts < ActiveRecord::Migration
  def change
    change_column :accounts, :status, 'integer USING 1'
  end
end
