class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.references :user
      t.datetime :signal_date

      t.timestamps
    end
  end
end
