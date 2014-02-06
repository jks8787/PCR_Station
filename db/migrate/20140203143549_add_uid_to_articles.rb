class AddUidToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :uid, :string, index: true
  end
end
