require "spec_helper"

RSpec.describe Persona do

  before :all do
    @persona = Persona.new("Adrian")
  end

  context "Habiendo una persona" do
    it "Debe tener un nombre" do
      expect(@persona.nombre).to eq("Adrian")
    end
    it "Debe tener un peso" do
      expect(@persona.peso).to eq(81.5)
    end
  end

end
