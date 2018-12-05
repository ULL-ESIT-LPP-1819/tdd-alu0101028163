require "spec_helper.rb"

RSpec.describe Paciente_obeso do

before :all do
  @paciente_obeso = Paciente_obeso.new("Adrian", 81.5, 1.68, 20, 0, 135.23, 146.32, 32.2, 23.4, 24.4, 26.4, 28.4)
end

    context "Habiendo un paciente" do
      it "debe tener un nombre" do
        expect(@paciente_obeso.nombre).to eq("Adrian")
      end
      it "debe tener un peso" do
        expect(@paciente_obeso.peso).to eq(81.5)
      end
      it "debe tener una altura" do
        expect(@paciente_obeso.talla).to eq(1.68)
      end
      it "debe tener una edad" do
        expect(@paciente_obeso.edad).to eq(20)
      end
      it "debe tener un sexo" do
        expect(@paciente_obeso.sexo).to eq(0)
      end
      it "debe imprimirse bien su información" do
        expect(@paciente_obeso.to_s).to eq(%Q{Nombre: Adrian
       Peso: 81.5
       Altura: 1.68
       Edad: 20
       Sexo: Hombre
       Circunferencia cintura: 135.23
       Circunferencia cadera: 146.32
       Circunferencia brazo: 32.2
       Pliegue tricipital: 23.4
       Pliegue bicipital: 24.4
       Pliegue subescapular: 26.4
       Pliegue suprailiaco: 28.4})
      end
    end

    context "Debe tener definidas las circunferencias" do
        it "de su cintura" do
          expect(@paciente_obeso.cir_cintura).to eq(135.23)
        end
        it "de su cadera" do
          expect(@paciente_obeso.cir_cadera).to eq(146.32)
        end
        it "de su brazo" do
          expect(@paciente_obeso.cir_brazo).to eq(32.2)
        end
      end

    context "Debe tener definidos los pliegues" do
      it "tricipital" do
        expect(@paciente_obeso.pl_tricipital).to eq(23.4)
      end
      it "bicipital" do
        expect(@paciente_obeso.pl_bicipital).to eq(24.4)
      end
      it "subescapular" do
        expect(@paciente_obeso.pl_subescapular).to eq(26.4)
      end
      it "suprailiaco" do
        expect(@paciente_obeso.pl_suprailiaco).to eq(28.4)
      end
    end
    # respond to
    context "Los pacientes obesos deberían" do
      it "peternecer a la clase a Paciente_obeso" do
        expect(@paciente_obeso.class).to eq(Paciente_obeso)
      end
      it "tener como clase padre a la clase Paciente" do
        expect(@paciente_obeso.class.superclass).to eq(Paciente)
      end
      it "pertenecer a una clase la cual es una instancia de Class" do
        expect(@paciente_obeso.class.instance_of?(Class)).to eq(true)
      end
      it "ser de tipo object" do
        expect(@paciente_obeso.is_a?(Object)).to eq(true)
      end
      it "y por lo tanto de tipo BasicObject" do
        expect(@paciente_obeso.is_a?(BasicObject)).to eq(true)
      end
    end


end
