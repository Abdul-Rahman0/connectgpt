class CreateEventParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :event_participations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :event, foreign_key: true, null: false
      t.timestamps
    end

    add_index :event_participations, [:user_id, :event_id], unique: true
  end
end
