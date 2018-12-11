require "spec_helper"

RSpec.describe "generador_menu" do
  before :all do
    @registro = Registro.new("Adrian", 80, 168, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
  end
  context "El generador de menú" do
    it "debe poder calcular el peso teórico ideal" do
    expect(peso_teorico(@registro.talla)).to eq(63.5)
    end
    it "debe poder calcular el gasto energético basal" do
    expect(GASTO_BASAL.call(@registro.peso, @registro.talla, @registro.edad, @registro.sexo)).to eq(1755)
    end
    it "debe poder calcular el efecto termógeno" do
    expect(efecto_termogeno(@registro.peso, @registro.talla, @registro.edad, @registro.sexo, GASTO_BASAL)).to eq(175.5)
    end
    it "debe poder calcular el gasto de actividad física" do
    expect(gasto_actividad_fisica(@registro.peso, @registro.talla, @registro.edad, @registro.sexo, GASTO_BASAL, 0.12)).to eq(210.6)
    end
    it "debe poder calcular el gasto energético total" do
    expect(gasto_energetico_total(@registro.peso, @registro.talla, @registro.edad, @registro.sexo, GASTO_BASAL, 0.12)).to eq(2141.1)
    end
  end
end
