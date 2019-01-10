require "spec_helper"

RSpec.describe Menu do
  before :all do
    @menu = Menu.new("Lunes") do
    titulo "Bajo en calorias"
    ingesta :min => 30, :max => 35
    desayuno :descripcion => "Pan de trigo integral",
    :porcion => "1 rodaja",
    :gramos => 100,
    :grasas => 3.3,
    :carbohidratos => 54.0,
    :proteinas => 11.0,
    :fibra => 2.3,
    :azucares => 5.5,
    :sal => 0.06
    desayuno :descripcion => "Actimel",
    :porcion => "1 porcion",
    :gramos => 100,
    :grasas => 3.4,
    :carbohidratos => 4.4,
    :proteinas => 3.6,
    :sal => 0.05
    almuerzo :descripcion => "Arroz",
    :porcion => "1 taza",
    :gramos => 100,
    :grasas => 0.9,
    :carbohidratos => 81.6,
    :proteinas => 6.67,
    :fibra => 1.4,
    :azucares => 2.3,
    :sal => 0.04
    almuerzo :descripcion => "Lentejas",
    :porcion => "1/2 cuchar´on",
    :grasas => 0.4,
    :carbohidratos => 20.0,
    :proteinas => 9.0,
    :fibra => 8.0,
    :sal => 0.02
    almuerzo :descripcion => "Naranja",
    :porcion => "1 pieza",
    :gramos => 100,
    :grasas => 0.12,
    :carbohidratos => 11.75,
    :proteinas => 0.94,
    :azucares => 6.4,
    :fibra => 2.4
    cena :descripcion => "Leche entera hacendado",
    :porcion => "1 vaso",
    :gramos => 100,
    :grasas => 3.6,
    :carbohidratos => 4.6,
    :proteinas => 3.1,
    :azucares => 4.5,
    :sal => 0.13
  end
  end


  context "Habiendo creado un menu dietetico" do

    it "Debe tener un dia de la semana" do
      expect(@menu.name).to eq("Lunes")
    end

    it "Debe haber un valor energetico total" do
      expect(@menu.v_energetico_total).to eq(1052.92)
    end

  end

end
