require 'spec_helper'

describe FormsController do
  describe "GET index" do
    
  end

  describe "POST create" do
    it "creates a new form" do
      Form.should_receive(:new).with("fields" => [
        {
          "type" => "text",
          "label" => "Firstname"
        },
          "type" => "text",
          "label" => "Surname"
        ])
    end
    it "saves the form"
  end
end
