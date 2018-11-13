require 'list'

RSpec.describe List do

before :each do
  @lista = List.new()
  @nodo = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0))
end

  context "Habiendo creado una lista" do
      it "Los valores de head y tail deberían ser nil" do
        expect(@lista.head).to eq(nil)
        expect(@lista.tail).to eq(nil)
      end
      it "Y el valor del tamaño debería de ser cero" do
         expect(@lista.size).to eq(0)
      end

      context "Cuando empujamos un elemento por medio de un push_back" do
              it "El nodo debería apuntar al nodo al que previamente apuntaba tail" do
                nodo_previo_tail = @lista.tail
                @lista.push_back(@nodo)
                expect(@nodo.prev).to eq(nodo_previo_tail)
              end
              it "y Tail debería de apuntar al nuevo nodo" do
                @lista.push_back(@nodo)
                expect(@lista.tail).to eq(@nodo)
              end
        end

        context "Cuando empujamos un elemento por medio de un push_front" do
                it "El nodo debería apuntar al nodo al que previamente apuntaba head" do
                  nodo_previo_head = @lista.head
                  @lista.push_front(@nodo)
                  expect(@nodo.next).to eq(nodo_previo_head)
                end
                it "y Head debería de apuntar al nuevo nodo" do
                  @lista.push_front(@nodo)
                  expect(@lista.head).to eq(@nodo)
                end
          end
    end

  end
