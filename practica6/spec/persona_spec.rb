require "spec_helper"

RSpec.describe Persona do

  before :all do
    @persona = Persona.new("Adrian", 81.5, 1.68, 20, 0)
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

    it "La etiqueta se imprime correctamente" do
      expect(@persona.to_s).to eq(%Q{Nombre: Adrian
     Peso: 81.5
     Altura: 1.68
     Edad: 20
     Sexo: Hombre})
    end

    end

    context "Las personas deberían" do
      it "pertenecer a la clase a Persona" do
        expect(@persona.class).to eq(Persona)
      end
      it "pertenecer a una clase la cual es una instancia de Class" do
        expect(@persona.class.instance_of?(Class)).to eq(true)
      end
      it "ser de tipo object" do
        expect(@persona.is_a?(Object)).to eq(true)
      end
      it "y por lo tanto de tipo BasicObject" do
        expect(@persona.is_a?(BasicObject)).to eq(true)
      end
    end


end
