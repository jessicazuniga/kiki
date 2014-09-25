class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :time
      t.string :place
      t.text :description
      t.references :group, index: true

      t.timestamps
    end
  end
end
