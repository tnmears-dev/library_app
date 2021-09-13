class CreateBooks < ActiveRecord::Migration[6.1]
    def change
        create_table :books do |t|
            t.string :title
            t.string :cat_ddc
            t.string :cat_loc
            t.string :edition
            t.string :binding
            t.string :copyright
            t.timestamps

        end
    end
end
