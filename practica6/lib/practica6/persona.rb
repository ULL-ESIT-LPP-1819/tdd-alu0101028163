class Persona

  attr_reader :nombre, :peso, :talla, :edad, :sexo
  def initialize(nombre, peso, talla, edad, sexo)
    @nombre = nombre
    @peso = peso
    @talla = talla
    @edad = edad
    @sexo = sexo
  end

  def to_s
    s = "Nombre: #{@nombre}
     Peso: #{@peso}
     Altura: #{@talla}
     Edad: #{@edad}
     "
     if @sexo == 0
       s << "Sexo: Hombre"
     else s << "Sexo: Mujer"
     end
  end

end
