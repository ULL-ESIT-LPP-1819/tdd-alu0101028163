require "spec_helper.rb"

RSpec.describe Paciente do

  before :all do
    @paciente = Paciente.new("Adrian", 81.5, 1.68, 20, 0, 135.23, 146.32, 32.2, 23.4, 24.4, 26.4, 28.4)
    @paciente2 = Paciente.new("Adrian", 81.5, 1.68, 20, 0)
  end

  context "Habiendo un paciente" do
    it "debe tener un nombre" do
      expect(@paciente.nombre).to eq("Adrian")
    end
    it "debe tener un peso" do
      expect(@paciente.peso).to eq(81.5)
    end
    it "debe tener una altura" do
      expect(@paciente.talla).to eq(1.68)
    end
    it "debe tener una edad" do
      expect(@paciente.edad).to eq(20)
    end
    it "debe tener un sexo" do
      expect(@paciente.sexo).to eq(0)
    end
  end


end
