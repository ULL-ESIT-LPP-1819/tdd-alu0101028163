class Persona

  attr_reader :nombre, :peso, :talla, :edad, :sexo
  def initialize(nombre, peso, talla, edad, sexo)
    @nombre = nombre
    @peso = peso
    @talla = talla
    @edad = edad
    @sexo = sexo
  end

end
