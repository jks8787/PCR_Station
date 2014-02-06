class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :author
			t.references :user, index: true

      t.timestamps
    end
  end
end
