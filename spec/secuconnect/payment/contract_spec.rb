RSpec.describe Secuconnect::Payment::Contract, vcr: true do
  
  describe "contract index" do
    subject(:response) { described_class.new.index }
    
    it 'return index data' do
      expect(response).to have_key "data"
      expect(response).to have_key "count"
    end
  end
  
  describe "contract show" do
    let(:account_id) { 'GCR_W27MYFEB7VYQ4AYXUSFZD278H8AWOX' }

    subject(:response) { described_class.new.show(account_id: account_id) }

    it 'return contract for id' do
      expect(response).to be_success
      expect(JSON.parse(response.body)).to have_key "object"
    end
  end

  describe "contract validate" do
    let(:account_id) { 'GCR_W27MYFEB7VYQ4AYXUSFZD278H8AWOX' }

    subject(:response) { described_class.new.validate(account_id: account_id) }

    it 'return true for valid id' do
      expect(response).to be true
    end
  end

  describe "contract creation" do
    let(:account_id) { 'GCR_W27MYFEB7VYQ4AYXUSFZD278H8AWOX' }
    let(:body) do 
      {
        contact: {
          salutation: 'Mr',
          forename: 'John',
          surname: 'Doe',
          dob: '1980-02-03',
          email: 'john.doe@example.com',
          mobile: '',
          address: {
            street: 'Test Street',
            street_number: '6',
            postal_code: '01234',
            city: 'Examplecity',
            country: 'Germany'
          },
        },  
        project: "project_name #{DateTime.now.to_i} Test #{SecureRandom.uuid}",
        payout_account: {
          iban: 'DE89370400440532013000',
          bic: '',
          owner: 'Test 1'
        }
      }  
    end

    subject(:response) { described_class.new.create(account_id: account_id, body: body ) }
    
    it 'create a new contract' do
      expect(response).to be_success
    end
  end
end
