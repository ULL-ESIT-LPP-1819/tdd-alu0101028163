class Paciente < Persona

  # @param nombre [number] nombre del paciente.
  # @param peso [number] peso del paciente.
  # @param talla [number] altura del paciente en metros.
  # @param edad [number] edad del paciente.
  # @param sexo [number] sexo del paciente, 0 corresponde a hombre y 1 a mujer.
  # @return [Paciente] retorna una instancia de la clase Paciente.
  def initialize(nombre, peso, talla, edad, sexo)
    super(nombre, peso, talla, edad, sexo)
  end

end
