class CreateRelatedEvents < ActiveRecord::Migration
  def change
    create_table :related_events do |t|
      t.references :comment, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
