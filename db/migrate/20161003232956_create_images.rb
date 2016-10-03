class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end

    add_attachment :images, :image
  end
end
