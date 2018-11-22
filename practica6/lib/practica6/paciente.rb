class Paciente < Persona

attr_reader :cir_cintura, :cir_cadera, :cir_brazo
  def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, cir_brazo)
    super(nombre, peso, talla, edad, sexo)
    @cir_cintura = cir_cintura
    @cir_cadera = cir_cadera
    @cir_brazo = cir_brazo
  end
end
