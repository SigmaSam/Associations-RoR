class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.date :date
      t.string :location
      t.integer :creator_id   

      t.timestamps
    end
  end
end
