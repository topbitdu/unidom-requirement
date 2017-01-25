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

  end

end
