class CreateBookmarks < ActiveRecord::Migration[5.2]
  def up
    create_table :bookmarks do |t|
      t.string :session_user_id
      t.string :place
      t.date :deleted_at

      t.timestamps
    end
  end

  def down
    drop_table :bookmarks
  end
end
