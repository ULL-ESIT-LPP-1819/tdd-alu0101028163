require "spec_helper"

RSpec.describe Persona do

  before :all do
    @persona = Persona.new
  end

  context "Habiendo una persona" do
    it "Debe tener un nombre" do
      expect(@persona.nombre).to eq("Adrian")
    end
  end

end
