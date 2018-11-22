class Persona

  attr_reader :nombre, :peso, :talla, :edad
  def initialize(nombre, peso, talla, edad)
    @nombre = nombre
    @peso = peso
    @talla = talla
    @edad = edad
  end

end
