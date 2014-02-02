class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.references :articles, index: true
      t.references :primers, index: true

      t.timestamps
    end
  end
end
