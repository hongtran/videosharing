class CreateVideoShareds < ActiveRecord::Migration[7.0]
  def change
    create_table :video_shareds do |t|
      t.string :title
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
