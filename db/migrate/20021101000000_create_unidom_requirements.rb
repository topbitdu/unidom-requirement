class CreateUnidomRequirements < ActiveRecord::Migration

  def change

    create_table :unidom_requirements, id: :uuid do |t|

      t.references :superior_requirement, type: :uuid, null: true,
        polymorphic: { null: true,  default: nil, limit: 200 }
      t.references :requirer,             type: :uuid, null: false,
        polymorphic: { null: false, default: '',  limit: 200 }
      t.references :required,             type: :uuid, null: true,
        polymorphic: { null: true,  default: nil, limit: 200 }
      t.references :facility,             type: :uuid, null: true,
        polymorphic: { null: true,  default: '',  limit: 200 }
      t.references :reason,               type: :uuid, null: true,
        polymorphic: { null: true,  default: nil, limit: 200 }

      t.decimal :estimated_budget, null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :quantity,         null: false, default: 0.0, precision: 12, scale: 2

      t.date :required_on, null: false, default: nil

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_requirements, :superior_requirement_id
    add_index :unidom_requirements, :requirer_id
    add_index :unidom_requirements, :required_id
    add_index :unidom_requirements, :facility_id
    add_index :unidom_requirements, :reason_id

  end

end
