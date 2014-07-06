class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
