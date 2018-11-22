require "spec_helper"

RSpec.describe Persona do

  before :all do
    @persona = Persona.new("Adrian", 81.5, 1.68, 20, 0, 135.23, 146.32, 32.2)
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
    it "Debe tener definido un sexo" do
      expect(@persona.sexo).to eq(0)
    end

    context "Debe tener definidas las circufenrencias" do
      it "de su cintura" do
        expect(@persona.cir_cintura).to eq(135.23)
      end
      it "de su cadera" do
        expect(@persona.cir_cadera).to eq(146.32)
      end
      it "de su brazo" do
        expect(@persona.cir_brazo).to eq(32.2)
      end
    end

  end

end
