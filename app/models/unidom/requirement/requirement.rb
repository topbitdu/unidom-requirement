##
# Requirement 是需求，表示参与者的某种需要，并作用于某个设施。

class Unidom::Requirement::Requirement < Unidom::Requirement::ApplicationRecord

  self.table_name = 'unidom_requirements'

  include Unidom::Common::Concerns::ModelExtension

  #validates :estimated_budget, presence: true, numericality: { less_than: 1_000_000_000, greater_than: 0 }
  #validates :quantity,         presence: true, numericality: { less_than: 1_000_000_000, greater_than: 0 }

  validates :estimated_budget, presence: true, numericality: { less_than: Unidom::Common::MAXIMUM_AMOUNT, greater_than: 0 }
  validates :quantity,         presence: true, numericality: { less_than: Unidom::Common::MAXIMUM_AMOUNT, greater_than: 0 }

  belongs_to :superior_requirement, class_name:  'Unidom::Requirement::Requirement'
  belongs_to :requirer,             polymorphic: true
  belongs_to :required,             polymorphic: true
  belongs_to :facility,             polymorphic: true
  belongs_to :reason,               polymorphic: true

  has_many :inferior_requirements, class_name: 'Unidom::Requirement::Requirement', foreign_key: :superior_requirement_id

  scope :superior_requirement_is, ->(superior_requirement) { where superior_requirement_id: to_id(superior_requirement) }
  scope :required_by,             ->(requirer)             { where requirer:                requirer                    }
  scope :facility_is,             ->(facility)             { where facility:                facility                    }
  scope :caused_by,               ->(reason)               { where reason:                  reason                      }

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Requirement::Requirement'
