class CreateRequiredExps < ActiveRecord::Migration[6.0]
  def change
    create_table :required_exps do |t|
      t.integer :level, null: false
      t.integer :required_exp, null: false

      t.timestamps
    end

    add_index :required_exps, :level, unique: true
  end
end
