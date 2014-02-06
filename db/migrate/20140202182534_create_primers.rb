class CreatePrimers < ActiveRecord::Migration
  def change
    create_table :primers do |t|
      t.text :note
      t.text :primer_seq
      t.references :user, index: true

      t.timestamps
    end
  end
end
