class AddTimestampsToCmsSites < ActiveRecord::Migration
  def change
    add_timestamps(:cms_sites)
  end
end
