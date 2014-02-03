class RemovePrimersIdFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :primers_id
  	remove_column :users, :articles_id
  end

  def down
    add_column :users, :primers_id
    add_column :users, :articles_id
  end

end

