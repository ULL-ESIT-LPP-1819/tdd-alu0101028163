require "spec_helper"

RSpec.describe Registro do


  context "Los objetos de la clase Registro deben ser comparables entre si" do
    it "se retorna cero cuando ambos operandos son iguales" do
      registro1 = Registro.new("Adrian", 80, 1.68, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
      registro2 = Registro.new("Adrian", 80, 1.68, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
      expect(registro1 <=> registro2).to eq(0)
    end
    it "se retorna -1 cuando el primer operando es menor que el segundo" do
      registro1 = Registro.new("Dummy", 40, 1.68, 20, 0, 122.3 , 112.3, 130.3 , 11.3 , 14.2, 10.4, 11.5)
      registro2 = Registro.new("Adrian", 80, 1.68, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
      expect(registro1 <=> registro2).to eq(-1)
    end
    it "se retorna 1 cuando el primer operando es mayor que el segundo" do
      registro1 = Registro.new("Adrian", 80, 1.68, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
      registro2 = Registro.new("Dummy", 40, 1.68, 20, 0, 122.3 , 112.3, 130.3 , 11.3 , 14.2, 10.4, 11.5)
      expect(registro1 <=> registro2).to eq(1)
    end
    it "se retorna nil cuando los operadores no pueden ser comparados" do
      registro1 = Registro.new("Adrian", 80, 1.68, 20, 0, 132.3 , 122.3, 140.3 , 12.3 , 15.2, 11.4, 10.5)
      Dummy = Struct.new(:imc)
      Dummy.new("foo")
      expect(registro1 <=> Dummy.new("foo")).to eq(nil)
    end


end

end
