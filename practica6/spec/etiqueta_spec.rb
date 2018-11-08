require 'etiqueta'

RSpec.describe Etiqueta do

  before :each do
    @etiqueta = Etiqueta.new([0,0], [0,0,0], [0,0,0], 0, 0, 0, 0, false, 0, 0)
    @etiqueta_ = Etiqueta.new([2380.24, 572.76], [17.3,10,12], [41.2,4.15,5.12], 3.3 , 2.4, 1.2, 0, false, 0, 0)
  end

  context "Habiendo una etiqueta" do

    it "debe haber un valor energético" do
      expect(@etiqueta.valor_energetico)
    end

    context "que debe ser cero" do
      it "si se le administra el valor cero" do
        expect(@etiqueta.valor_energetico[0]).to eq(0)
        expect(@etiqueta.valor_energetico[1]).to eq(0)
      end
    end

    it "debe haber una cantidad de grasas" do
      expect(@etiqueta.grasas)
    end

    it "de las cuales deben haber saturadas, monoinsaturadas y poliinsaturadas" do
      expect(@etiqueta.grasas.count).to eq(3)
    end

    it "debe haber una cantidad de Hidratos de carbono" do
      expect(@etiqueta.hidratos_carbono)
    end

    it "de los cuales deben haber azúcares, polialcoholes y almidón" do
      expect(@etiqueta.hidratos_carbono.count).to eq(3)
    end

    it "debe haber una cantidad de fibra alimentaria" do
      expect(@etiqueta.fibra_alimentaria)
    end

    context "que debe ser cero" do
      it "si se le administra el valor cero" do
        expect(@etiqueta.fibra_alimentaria).to eq(0)
      end
    end

    it "debe haber una cantidad de proteinas" do
    expect(@etiqueta.proteinas)
    end

    context "que debe ser cero" do
      it "si se le administra el valor cero" do
        expect(@etiqueta.proteinas).to eq(0)
      end
    end

    it "debe haber una cantidad de sal" do
    expect(@etiqueta.sal)
    end

    context "que debe ser cero" do
      it "si se le administra el valor cero" do
        expect(@etiqueta.sal).to eq(0)
      end
    end

    it "debe haber una cantidad de Vitamina" do
    expect(@etiqueta.vitamina)
    end

    context "que debe ser cero" do
      it "si se le administra el valor cero" do
        expect(@etiqueta.vitamina).to eq(0)
      end
    end

    it "la etiqueta se imprime correctamente" do
      expect(@etiqueta_.to_s).to eq(%Q{Valor energético por 100g o 100ml de producto .... 2380.24 kcal / 572.76 kj
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
    Sal .................. 1.2 gr})
    end

  end

  context "El producto puede venir almacenado en porciones" do
      it "por defecto no lo estará" do
        expect(@etiqueta.porciones).to eq(false)
      end

      context "y en caso contrario" do

        etiqueta2 = Etiqueta.new(0, [0,0,0], [0,0,0], 0, 0, 0, 0, true, 3, 25)

        it "deberá indicarse que viene en porciones" do
          expect(etiqueta2.porciones).to eq(true)
        end

        it "cuantas hay" do
          expect(etiqueta2.cantidad_porciones).to eq(3)
        end

        it "y de qué tamaño son" do
          expect(etiqueta2.tamanio_porciones).to eq(25)
        end





      end


    end

  context "El valor total de las grasas" do
    it "debe ser igual a la suma de todos los valores que la componen" do
      expect(@etiqueta_.total_grasas()).to eq(39.3)
    end
  end

  context "El valor total de los hidratos" do
    it "debe ser igual a la suma de todos los valores que los componen" do
      expect(@etiqueta_.total_hidratos()).to eq(50.47)
    end
  end

  context "Las energía que aportan las grasas" do

    it "es de 37kj por gramo de grasas saturadas" do
        energia = @etiqueta_.energia_g_saturadas()
        expect(energia[0]).to eq(640.1)
    end

    it "equivalente a 9kcal por gramo" do
        energia = @etiqueta_.energia_g_saturadas()
        expect(energia[1]).to eq(155.7)
    end

    it "además de 37kj por gramo de grasas monoinsaturadas" do
        energia = @etiqueta_.energia_g_monoinsaturadas()
        expect(energia[0]).to eq(370)
    end

    it "equivalente a 9kcal por gramo" do
        energia = @etiqueta_.energia_g_monoinsaturadas()
        expect(energia[1]).to eq(90)
    end

    it "y 37kj por gramo de grasas polinsaturadas" do
        energia = @etiqueta_.energia_g_polinsaturadas()
        expect(energia[0]).to eq(444)
    end

    it "equivalente a 9kcal por gramo" do
      energia = @etiqueta_.energia_g_polinsaturadas()
      expect(energia[1]).to eq(108)
    end



  end

  context "La energía que aportan los hidratos" do

    it "Es de 17kj por gramo para los azúcares" do
      energia = @etiqueta_.energia_azucares()
      expect(energia[0]).to eq(700.4)
    end

    it "que equivalen a 4 kcal" do
      energia = @etiqueta_.energia_azucares()
      expect(energia[1]).to eq(164.8)
    end

    it "Además de 10kj por gramo para los polialcoles" do
      energia = @etiqueta_.energia_polialcoles()
      expect(energia[0]).to eq(41.5)
    end

    it "equivalente a 2.5kcal" do
      energia = @etiqueta_.energia_polialcoles()
      expect(energia[1]).to eq(10.38)
    end

    it "y de 17kj por gramo para el almidón" do
      energia = @etiqueta_.energia_almidon()
      expect(energia[0]).to eq(87.04)
    end

    it "equivalentes a 4kcal por gramo" do
      energia = @etiqueta_.energia_almidon()
      expect(energia[1]).to eq(20.48)
    end


  end

  context "La energía que aporta la fibra alimentaria" do

    it "es de 8kj por gramo" do
        energia = @etiqueta_.energia_fibra()
        expect(energia[0]).to eq(26.4)
    end

    it "equivalente a 2 kcal" do
      energia = @etiqueta_.energia_fibra()
      expect(energia[1]).to eq(6.6)
    end

  end

  context "La energía que aportan las proteínas " do

    it "es de 17kj por gramo" do
      energia = @etiqueta_.energia_proteinas()
      expect(energia[0]).to eq(40.8)
    end

    it "equivalente a 4kcal por gramo" do
      energia = @etiqueta_.energia_proteinas()
      expect(energia[1]).to eq(9.6)
    end

  end

  context "La energía que aporta la sal" do
      it "es de 25kj por gramo" do
        energia = @etiqueta_.energia_sal()
        expect(energia[0]).to eq(30)
      end

      it "equivalente a 6kcal" do
        energia = @etiqueta_.energia_sal()
        expect(energia[1]).to eq(7.2)
      end

  end

  context "El valor energético total es equivalente a la suma del valor energético de todos los nutrientes" do
    it "expresado en kj" do
      sum = @etiqueta_.valor_energetico_total()
      expect(sum[0]).to eq(@etiqueta_.valor_energetico[0])
    end
    it "y expresado en kcal" do
      sum = @etiqueta_.valor_energetico_total()
      expect(sum[1]).to eq(@etiqueta_.valor_energetico[1])
    end



  end





end
