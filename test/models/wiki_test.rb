require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body") }


  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body")
    end
  end
end
