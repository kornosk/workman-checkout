class CreateAbsences < ActiveRecord::Migration[5.0]
  def change
    create_table :absences do |t|
    	t.string :remark
    	t.date :start
    	t.date :end
    	t.references :user, foreign_key: true

      	t.timestamps
    end
  end
end
