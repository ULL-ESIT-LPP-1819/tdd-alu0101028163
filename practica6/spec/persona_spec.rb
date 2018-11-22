require "spec_helper"

RSpec.describe Persona do

  before :all do
    @persona = Persona.new("Adrian", 81.5, 1.68, 20)
  end

  context "Habiendo una persona" do
    it "Debe tener un nombre" do
      expect(@persona.nombre).to eq("Adrian")
    end
    it "Debe tener un peso" do
      expect(@persona.peso).to eq(81.5)
    end
    it "Debe tener una altura" do
      expect(@persona.talla).to eq(1.68)
    end
    it "Debe tener una edad" do
      expect(@persona.edad).to eq(20)
    end
  end

end
