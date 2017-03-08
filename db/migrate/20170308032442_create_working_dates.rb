class CreateWorkingDates < ActiveRecord::Migration[5.0]
  def change
    create_table :working_dates do |t|
    	t.datetime :start
    	t.datetime :end
    	t.references :user, foreign_key: true

      	t.timestamps
    end
  end
end
