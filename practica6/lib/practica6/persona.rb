class Persona

  attr_reader :nombre, :peso, :talla, :edad, :sexo, :cir_cintura, :cir_cadera, :cir_brazo
  def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, cir_brazo)
    @nombre = nombre
    @peso = peso
    @talla = talla
    @edad = edad
    @sexo = sexo
    @cir_cintura = cir_cintura
    @cir_cadera = cir_cadera
    @cir_brazo = cir_brazo
  end

end
