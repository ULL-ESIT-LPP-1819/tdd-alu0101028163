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
    end

    context "Debe tener definidas las circunferencias" do
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

    context "Debe tener definidos los pliegues" do
      it "tricipital" do
        expect(@persona.pl_tricipital).to eq(23.4)
      end
      it "bicipital" do
        expect(@persona.pl_bicipital).to eq(24.4)
      end
      it "subescapular" do
        expect(@persona.pl_subescapular).to eq(26.4)
      end
      it "suprailiaco" do
        expect(@persona.pl_suprailiaco).to eq(28.4)
      end

    end

end
