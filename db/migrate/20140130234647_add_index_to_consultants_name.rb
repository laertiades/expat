class AddIndexToConsultantsName < ActiveRecord::Migration
  def change
    add_index :consultants, :name, unique: true
  end
end
