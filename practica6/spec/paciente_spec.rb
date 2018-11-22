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


  context "Puede tener definidas las circunferencias" do
      it "de su cintura" do
        expect(@paciente.cir_cintura).to eq(135.23)
        expect(@paciente2.cir_cintura).to eq(nil)
      end
      it "de su cadera" do
        expect(@paciente.cir_cadera).to eq(146.32)
        expect(@paciente2.cir_cadera).to eq(nil)
      end
      it "de su brazo" do
        expect(@paciente.cir_brazo).to eq(32.2)
        expect(@paciente2.cir_brazo).to eq(nil)
      end
    end

    context "Puede tener definidos los pliegues" do
      it "tricipital" do
        expect(@paciente.pl_tricipital).to eq(23.4)
        expect(@paciente2.pl_tricipital).to eq(nil)
      end
      it "bicipital" do
        expect(@paciente.pl_bicipital).to eq(24.4)
        expect(@paciente2.pl_bicipital).to eq(nil)
      end
      it "subescapular" do
        expect(@paciente.pl_subescapular).to eq(26.4)
        expect(@paciente2.pl_subescapular).to eq(nil)
      end
      it "suprailiaco" do
        expect(@paciente.pl_suprailiaco).to eq(28.4)
        expect(@paciente2.pl_suprailiaco).to eq(nil)
      end
    end

    context "En caso de estar definidas las circuferencias y pliegues" do
      it "están en tratamiento para la obesidad" do
        expect(@paciente.tiene_obesidad).to eq(true)
      end
    end
    context "En caso contrario" do
      it "no estaría en tratamiento para la obesidad" do
        expect(@paciente2.tiene_obesidad).to eq(false)
      end
    end
end
