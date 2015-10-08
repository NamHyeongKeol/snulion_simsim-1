class CreateResps < ActiveRecord::Migration
  def change
    create_table :resps do |t|
      
      t.integer :talk_id
      t.text :message

      t.timestamps null: false
    end
  end
end
