require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { User.create!(username: "Blocipedia User", email: "user@blocipedia.com", password: "password" ) }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: user) }


   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
   it { should validate_presence_of(:user) }

   it { is_expected.to validate_length_of(:title).is_at_least(5) }
   it { is_expected.to validate_length_of(:body).is_at_least(5) }



  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes( title: "New Wiki Title", body: "New Wiki Body", user: user )
    end
  end

end
