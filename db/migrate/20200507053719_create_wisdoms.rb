class CreateWisdoms < ActiveRecord::Migration[5.2]
  def change
    create_table :wisdoms do |t|
      t.string :author, null: false
      t.text :word
      t.timestamps
    end
  end
end
