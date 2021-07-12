class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.date :date
      t.time :time
      t.references :creator, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
