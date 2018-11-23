require "spec_helper.rb"

RSpec.describe Paciente do

  before :all do
    @paciente = Paciente.new("Adrian", 81.5, 1.68, 20, 0)
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
    it "La etiqueta se imprime correctamente" do
      expect(@paciente.to_s).to eq(%Q{Nombre: Adrian
     Peso: 81.5
     Altura: 1.68
     Edad: 20
     Sexo: Hombre})
    end
  end

  context "Los pacientes deberían" do
    it "pertenecer a la clase a Paciente" do
      expect(@paciente.class).to eq(Paciente)
    end
    it "tener como clase padre a la clase Persona" do
      expect(@paciente.class.superclass).to eq(Persona)
    end
    it "pertenecer a una clase la cual es una instancia de Class" do
      expect(@paciente.class.instance_of?(Class)).to eq(true)
    end
    it "ser de tipo object" do
      expect(@paciente.is_a?(Object)).to eq(true)
    end
    it "y por lo tanto de tipo BasicObject" do
      expect(@paciente.is_a?(BasicObject)).to eq(true)
    end
  end


end
