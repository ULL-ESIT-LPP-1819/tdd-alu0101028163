require "spec_helper"

RSpec.describe "pruebas_menu" do
  before :all do
    @registro = Registro.new("Adrian", 80, 168, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
  end
  context "En las pruebas del menú" do
    it "se debe poder calcular el peso teórico ideal" do
    expect(peso_teorico(@registro.talla)).to eq(63.5)
    end
    it "se debe poder calcular el gasto energético basal" do
    expect(gasto_basal(@registro.peso, @registro.talla, @registro.edad, @registro.sexo)).to eq(1755)
    end
    it "se debe poder calcular el efecto termógeno" do
    expect(efecto_termogeno(@registro.peso, @registro.talla, @registro.edad, @registro.sexo, )).to eq(175.5)
    end
    it "se debe poder calcular el gasto de actividad física" do
    expect(gasto_actividad_fisica(@registro.peso, @registro.talla, @registro.edad, @registro.sexo,  0.12)).to eq(210.6)
    end
    it "se debe poder calcular el gasto energético total" do
    expect(gasto_energetico_total(@registro.peso, @registro.talla, @registro.edad, @registro.sexo, 0.12)).to eq(2141.1)
    end
    it "se debe poder verificar que la cantida de alimentación debe ser suficiente para cubrir
        las exigencias calóricas del organismo y mantener el equilibrio de su balance." do
    etiqueta1 = Etiqueta.new([120.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    etiqueta2 = Etiqueta.new([1000, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    etiqueta3 = Etiqueta.new([1023.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    menu = [etiqueta1,etiqueta2,etiqueta3]
    expect(verificar_cantidad(menu,@registro.peso, @registro.talla, @registro.edad, @registro.sexo, 0.12)).to eq(true)
        end
  end
end
