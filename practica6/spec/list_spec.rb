require 'list'

RSpec.describe List do

before :each do
  @lista = List.new()
  @nodo1 = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 5, 0, false, 0, 0))
  @nodo2 = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 6, 0, false, 0, 0))
  @nodo3 = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 3, 0, false, 0, 0))
  @nodo4 = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 2, 0, false, 0, 0))
  @nodo5 = Struct.new(:prev, :next, :value).new(nil,nil,Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1, 0, false, 0, 0))

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

              it "Y el tamaño de la lista debería decrementar en una unidad" do
                @lista.push_front(@nodo1)
                @lista.push_front(@nodo2)
                prev_size = @lista.size
                @lista.pop_front
                expect(@lista.size).to eq(prev_size - 1)
              end
          end

          context "Cuando expulsamos un elemento por medio de pop_back" do
              it "Head debería de apuntar al nodo siguiente del que apuntada" do
                @lista.push_back(@nodo1)
                @lista.push_back(@nodo2)
                expect(@lista.tail).to eq(@nodo2)
                @lista.pop_back
                expect(@lista.tail).to eq(@nodo1)
              end

              it "Y el tamaño de la lista debería decrementar en una unidad" do
                @lista.push_back(@nodo1)
                @lista.push_back(@nodo2)
                prev_size = @lista.size
                @lista.pop_back
                expect(@lista.size).to eq(prev_size - 1)
              end
          end

          context "Cuando utilizamos el método [] " do
            it "podemos acceder a una posición concreta de la lista" do
              @lista.push_back(@nodo1)
              expect(@lista[0]).to eq(@nodo1)
            end
          end

          context "Cuando utilizamos el método clasificar" do
            it "la lista clasifica las etiquetas según sus gramos de sal" do
              @lista.push_back(@nodo1)
              @lista.push_back(@nodo2)
              @lista.push_back(@nodo3)
              @lista.push_back(@nodo4)
              @lista.push_back(@nodo5)
              expect(@lista[0].value.sal).to eq(5)
              expect(@lista[1].value.sal).to eq(6)
              expect(@lista[2].value.sal).to eq(3)
              expect(@lista[3].value.sal).to eq(2)
              expect(@lista[4].value.sal).to eq(1)
              @lista.clasificar
              expect(@lista[0].value.sal).to eq(1)
              expect(@lista[1].value.sal).to eq(2)
              expect(@lista[2].value.sal).to eq(3)
              expect(@lista[3].value.sal).to eq(5)
              expect(@lista[4].value.sal).to eq(6)

            end
          end

    end

  end
