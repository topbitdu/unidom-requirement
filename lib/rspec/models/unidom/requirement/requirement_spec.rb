describe Unidom::Requirement::Requirement, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      superior_requirement_id:   SecureRandom.uuid,
      superior_requirement_type: 'Unidom::Requirement::SuperiorRequirement::Mock',
      requirer_id:               SecureRandom.uuid,
      requirer_type:             'Unidom::Requirement::Requirer::Mock',
      required_id:               SecureRandom.uuid,
      required_type:             'Unidom::Requirement::Required::Mock',
      facility_id:               SecureRandom.uuid,
      facility_type:             'Unidom::Requirement::Facility::Mock',
      reason_id:                 SecureRandom.uuid,
      reason_type:               'Unidom::Requirement::Reason::Mock',
      estimated_budget:          2,
      quantity:                  1.00,
      required_on:               Date.current
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :estimated_budget,
      {                                      } => 0,
      { estimated_budget: nil                } => 2,
      { estimated_budget: ''                 } => 2,
      { estimated_budget: 'A'                } => 1,
      { estimated_budget: '-0.01'            } => 1,
      { estimated_budget: -0.01              } => 1,
      { estimated_budget: 0                  } => 1,
      { estimated_budget: '0'                } => 1,
      { estimated_budget: 0.01               } => 0,
      { estimated_budget: '0.01'             } => 0,
      { estimated_budget: '999_999_999.99'   } => 0,
      { estimated_budget: 999_999_999.99     } => 0,
      { estimated_budget: 1_000_000_000      } => 1,
      { estimated_budget: '1_000_000_000'    } => 1,
      { estimated_budget: 1_000_000_000.01   } => 1,
      { estimated_budget: '1_000_000_000.01' } => 1

    it_behaves_like 'validates', model_attributes, :quantity,
      {                              } => 0,
      { quantity: nil                } => 2,
      { quantity: ''                 } => 2,
      { quantity: 'A'                } => 1,
      { quantity: '-0.01'            } => 1,
      { quantity: -0.01              } => 1,
      { quantity: 0                  } => 1,
      { quantity: '0'                } => 1,
      { quantity: 0.01               } => 0,
      { quantity: '0.01'             } => 0,
      { quantity: '999_999_999.99'   } => 0,
      { quantity: 999_999_999.99     } => 0,
      { quantity: 1_000_000_000      } => 1,
      { quantity: '1_000_000_000'    } => 1,
      { quantity: 1_000_000_000.01   } => 1,
      { quantity: '1_000_000_000.01' } => 1

  end

end
