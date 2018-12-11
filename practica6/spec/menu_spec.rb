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
      
    end
  end
end
