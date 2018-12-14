require "spec_helper"

RSpec.describe "pruebas_menu" do
  before :all do
    @registro1 = Registro.new("Adrian", 80, 168, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
    @registro2 = Registro.new("Gamma", 120, 190, 32, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
    @registro3 = Registro.new("Beta", 60, 156, 45, 1, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
    @registro4 = Registro.new("Alpha", 76, 175, 18, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
    @registro5 = Registro.new("Umma", 245, 180, 56, 1, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
  end
  before :all do
    @etiqueta1 = Etiqueta.new([120.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    @etiqueta2 = Etiqueta.new([1000, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    @etiqueta3 = Etiqueta.new([1023.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    @etiqueta4 = Etiqueta.new([224.4, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    @etiqueta5 = Etiqueta.new([523.2, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
    @etiqueta6 = Etiqueta.new([670.53, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
  end
  context "En las pruebas del menú" do
    it "se debe poder calcular el peso teórico ideal" do
    expect(peso_teorico(@registro1.talla)).to eq(63.5)
    end
    it "se debe poder calcular el gasto energético basal" do
    expect(gasto_basal(@registro1.peso, @registro1.talla, @registro1.edad, @registro1.sexo)).to eq(1755)
    end
    it "se debe poder calcular el efecto termógeno" do
    expect(efecto_termogeno(@registro1.peso, @registro1.talla, @registro1.edad, @registro1.sexo, )).to eq(175.5)
    end
    it "se debe poder calcular el gasto de actividad física" do
    expect(gasto_actividad_fisica(@registro1.peso, @registro1.talla, @registro1.edad, @registro1.sexo,  0.12)).to eq(210.6)
    end
    it "se debe poder calcular el gasto energético total" do
    expect(gasto_energetico_total(@registro1.peso, @registro1.talla, @registro1.edad, @registro1.sexo, 0.12)).to eq(2141.1)
    end
    it "se debe poder verificar que la cantida de alimentación debe ser suficiente para cubrir
        las exigencias calóricas del organismo y mantener el equilibrio de su balance." do
    menu1 = [@etiqueta1,@etiqueta2,@etiqueta3] # 2143.48 kcal
    menu2 = [@etiqueta1,@etiqueta2,@etiqueta5] # 1643.44 kcal
    menu3 = [@etiqueta2,@etiqueta3,@etiqueta4,@etiqueta6] # 2918.17

    expect(verificar_cantidad(menu1,@registro1.peso, @registro1.talla, @registro1.edad, @registro1.sexo, 0.12)).to eq(true)
    expect(verificar_cantidad(menu1,@registro2.peso, @registro2.talla, @registro2.edad, @registro2.sexo, 0.0)).to eq(false)
    expect(verificar_cantidad(menu2,@registro3.peso, @registro3.talla, @registro3.edad, @registro3.sexo, 0.27)).to eq(true)
    expect(verificar_cantidad(menu3,@registro4.peso, @registro4.talla, @registro4.edad, @registro4.sexo, 0.54)).to eq(true)
    expect(verificar_cantidad(menu1,@registro5.peso, @registro5.talla, @registro5.edad, @registro5.sexo, 0.12)).to eq(false)
    end
  end
end
