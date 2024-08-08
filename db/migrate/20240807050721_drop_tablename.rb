class DropTablename < ActiveRecord::Migration[7.2]
  def up
    drop_table :users
  end
end
