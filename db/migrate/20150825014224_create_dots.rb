class CreateDots < ActiveRecord::Migration
  def change
    create_table :dots do |t|
      t.string :description

      t.timestamps
    end
  end
end
