require 'list'

RSpec.describe List do

before :each do
  @lista = List.new()
  @nodo1 = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0))
  @nodo2 = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0))

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
                @lista.push_back(@nodo1)
                expect(@nodo1.prev).to eq(nodo_previo_tail)
              end
              it "Tail debería de apuntar al nuevo nodo" do
                @lista.push_back(@nodo1)
                expect(@lista.tail).to eq(@nodo1)
              end

              it "Y el tamaño debería incrementarse en una unidad " do
                actual_size = @lista.size
                @lista.push_back(@nodo1)
                expect(@lista.size).to eq(actual_size + 1)
              end
        end

        context "Cuando empujamos un elemento por medio de un push_front" do
                it "El nodo debería apuntar al nodo al que previamente apuntaba head" do
                  nodo_previo_head = @lista.head
                  @lista.push_front(@nodo1)
                  expect(@nodo1.next).to eq(nodo_previo_head)
                end
                it "y Head debería de apuntar al nuevo nodo" do
                  @lista.push_front(@nodo1)
                  expect(@lista.head).to eq(@nodo1)
                end

                it "Y el tamaño debería incrementarse en una unidad " do
                  actual_size = @lista.size
                  @lista.push_front(@nodo1)
                  expect(@lista.size).to eq(actual_size + 1)
                end
          end

          context "Cuando expulsamos un elemento por medio de pop_front" do
              it "Head debería de apuntar al nodo siguiente del que apuntada" do
                @lista.push_front(@nodo1)
                @lista.push_front(@nodo2)
                expect(@lista.head).to eq(@nodo2)
                @lista.pop_front
                expect(@lista.head).to eq(@nodo1)
              end
          end

    end

  end
