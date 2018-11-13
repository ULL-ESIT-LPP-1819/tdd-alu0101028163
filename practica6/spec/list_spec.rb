require 'list'

RSpec.describe List do

before :each do
  @lista = List.new()
end

context "Habiendo creado una lista" do
    it "Los valores de head y tail deberían ser nil" do
      expect(@lista.head).to eq(nil)
      expect(@lista.tail).to eq(nil)
    end
    it "Y el valor del tamaño debería de ser cero" do
       expect(@lista.size).to eq(0)
    end
end

context "Cuando empujamos un elemento por medio de un push_back" do
    @nodo = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0))
    @lista.push_back(@nodo)
    it "Tail debería de apuntar a dicho objeto" do
       expect(@lista.tail).to eq(@nodo)
    end
end

end
