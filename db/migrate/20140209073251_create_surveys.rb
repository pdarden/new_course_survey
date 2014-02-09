class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :json_input
      t.text :json_output

      t.timestamps
    end
  end
end
