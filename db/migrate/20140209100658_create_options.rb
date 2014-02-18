class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :response_option

      t.timestamps
    end
  end
end
