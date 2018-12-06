class Persona

  attr_reader :nombre, :peso, :talla, :edad, :sexo
  # @param nombre [number] nombre del paciente.
  # @param peso [number] peso del paciente.
  # @param talla [number] altura del paciente en metros.
  # @param edad [number] edad del paciente.
  # @param sexo [number] sexo del paciente, 0 corresponde a hombre y 1 a mujer.
  # @return [Paciente] retorna una instancia de la clase Persona.
  def initialize(nombre, peso, talla, edad, sexo)
    @nombre = nombre
    @peso = peso
    @talla = talla
    @edad = edad
    @sexo = sexo
  end

  # @return [String] retorna una cadena con la información de la Persona.
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
