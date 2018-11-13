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

end
