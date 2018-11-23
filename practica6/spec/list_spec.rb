require "spec_helper"

RSpec.describe List do

before :each do
  @lista = List.new()
  @Etiqueta1 = Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 5, 0, false, 0, 0)
  @Etiqueta2 = Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 6, 0, false, 0, 0)
  @Etiqueta3 = Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 3, 0, false, 0, 0)
  @Etiqueta4 = Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 2, 0, false, 0, 0)
  @Etiqueta5 = Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1, 0, false, 0, 0)
end

before :all do
  @Paciente1 = Paciente_obeso.new("Adrian", 81.5, 1.68, 20, 0, 135.23, 146.32, 32.2, 23.4, 24.4, 26.4, 28.4)
  @Paciente2 = Paciente_obeso.new("Adrian", 85.5, 1.68, 20, 0, 135.23, 146.32, 32.2, 23.4, 24.4, 26.4, 21.4)
  @Paciente3 = Paciente_obeso.new("Adrian", 82.5, 1.68, 20, 0, 135.23, 146.32, 32.2, 23.4, 24.4, 26.4, 22.4)
  @Paciente4 = Paciente_obeso.new("Adrian", 88.5, 1.68, 20, 0, 135.23, 146.32, 32.2, 23.4, 24.4, 26.4, 29.4)
  @Paciente5 = Paciente_obeso.new("Adrian", 83.5, 1.68, 20, 0, 135.23, 146.32, 32.2, 23.4, 24.4, 26.4, 27.4)
end

  context "Habiendo creado una lista" do

      it "Los valores de head y tail deberían ser nil" do
        expect(@lista.head).to eq(nil)
        expect(@lista.tail).to eq(nil)
      end
      it "Y el valor del tamaño debería de ser cero" do
         expect(@lista.size).to eq(0)
      end
      it "Debería imprimirse correctamente" do
        @lista.push_back(@Etiqueta1)
        @lista.push_back(@Paciente1)
        expect(@lista.to_s).to eq(%Q{Valor energético por 100g o 100ml de producto .... 2380.24 kcal / 572.76 kj
    Grasas ........ 39.3 gr
    de las cuales
      saturadas .......... 17.3 gr
      monoinsaturadas .... 10 gr
      polinsaturadas ..... 12 gr
    Hidratos ............. 50.47 gr
    de los cuales
      azucares ........... 41.2 gr
      polialcoles ........ 4.15 gr
      almidon ............ 5.12 gr
    Fibra alimentaria .... 3.3 gr
    Proteínas ............ 2.4 gr
    Sal .................. 5 gr
    Nombre: Adrian
       Peso: 81.5
       Altura: 1.68
       Edad: 20
       Sexo: Hombre
       Circunferencia cintura: 135.23
       Circunferencia cadera: 146.32
       Circunferencia brazo: 32.2
       Pliegue tricipital: 23.4
       Pliegue bicipital: 24.4
       Pliegue subescapular: 26.4
       Pliegue suprailiaco: 28.4})
      end

      context "Cuando empujamos un elemento por medio de un push_back" do
              it "El nodo debería apuntar al nodo al que previamente apuntaba tail" do
                nodo_previo_tail = @lista.tail
                @lista.push_back(@Etiqueta1)
                expect(@lista.tail.prev).to eq(nodo_previo_tail)
              end

              it "Y el tamaño debería incrementarse en una unidad " do
                actual_size = @lista.size
                @lista.push_back(@Etiqueta1)
                expect(@lista.size).to eq(actual_size + 1)
              end
        end

        context "Cuando empujamos un elemento por medio de un push_front" do
                it "El nodo debería apuntar al nodo al que previamente apuntaba head" do
                  nodo_previo_head = @lista.head
                  @lista.push_front(@Etiqueta1)
                  expect(@lista.head.next).to eq(nodo_previo_head)
                end

                it "Y el tamaño debería incrementarse en una unidad " do
                  actual_size = @lista.size
                  @lista.push_front(@Etiqueta1)
                  expect(@lista.size).to eq(actual_size + 1)
                end
          end

          context "Cuando expulsamos un elemento por medio de pop_front" do
              it "Head debería de apuntar al nodo siguiente del que apuntada" do
                @lista.push_front(@Etiqueta1)
                nodo1 = @lista.head
                @lista.push_front(@Etiqueta2)
                nodo2 = @lista.head
                expect(@lista.head).to eq(nodo2)
                @lista.pop_front
                expect(@lista.head).to eq(nodo1)
              end

              it "Y el tamaño de la lista debería decrementar en una unidad" do
                @lista.push_front(@Etiqueta1)
                @lista.push_front(@Etiqueta2)
                prev_size = @lista.size
                @lista.pop_front
                expect(@lista.size).to eq(prev_size - 1)
              end
          end

          context "Cuando expulsamos un elemento por medio de pop_back" do
              it "Head debería de apuntar al nodo siguiente del que apuntada" do
                @lista.push_back(@Etiqueta1)
                nodo1 = @lista.tail
                @lista.push_back(@Etiqueta2)
                nodo2 = @lista.tail
                expect(@lista.tail).to eq(nodo2)
                @lista.pop_back
                expect(@lista.tail).to eq(nodo1)
              end

              it "Y el tamaño de la lista debería decrementar en una unidad" do
                @lista.push_back(@Etiqueta1)
                @lista.push_back(@Etiqueta2)
                prev_size = @lista.size
                @lista.pop_back
                expect(@lista.size).to eq(prev_size - 1)
              end
          end

          context "Cuando utilizamos el método [] " do
            it "podemos acceder a una posición concreta de la lista" do
              @lista.push_back(@Etiqueta1)
              nodo = @lista.head
              expect(@lista[0]).to eq(nodo)
            end
          end

          context "Cuando utilizamos el método clasificar" do
            it "la lista clasifica las etiquetas según sus gramos de sal" do
              @lista.push_back(@Etiqueta1)
              @lista.push_back(@Etiqueta2)
              @lista.push_back(@Etiqueta3)
              @lista.push_back(@Etiqueta4)
              @lista.push_back(@Etiqueta5)
              expect(@lista[0].value.sal).to eq(5)
              expect(@lista[1].value.sal).to eq(6)
              expect(@lista[2].value.sal).to eq(3)
              expect(@lista[3].value.sal).to eq(2)
              expect(@lista[4].value.sal).to eq(1)
              @lista.clasificar_etiquetas
              expect(@lista[0].value.sal).to eq(1)
              expect(@lista[1].value.sal).to eq(2)
              expect(@lista[2].value.sal).to eq(3)
              expect(@lista[3].value.sal).to eq(5)
              expect(@lista[4].value.sal).to eq(6)
            end
            it "la lista clasifica los pacientes según su índice de masa corporal" do
              @lista.push_back(@Paciente1)
              @lista.push_back(@Paciente2)
              @lista.push_back(@Paciente3)
              @lista.push_back(@Paciente4)
              @lista.push_back(@Paciente5)
              expect(@lista[0].value.registro.imc).to eq(28.88)
              expect(@lista[1].value.registro.imc).to eq(30.29)
              expect(@lista[2].value.registro.imc).to eq(29.23)
              expect(@lista[3].value.registro.imc).to eq(31.36)
              expect(@lista[4].value.registro.imc).to eq(29.58)
              @lista.clasificar_imc
              expect(@lista[0].value.registro.imc).to eq(28.88)
              expect(@lista[1].value.registro.imc).to eq(29.23)
              expect(@lista[2].value.registro.imc).to eq(29.58)
              expect(@lista[3].value.registro.imc).to eq(30.29)
              expect(@lista[4].value.registro.imc).to eq(31.36)
            end
          end

    end

  end
