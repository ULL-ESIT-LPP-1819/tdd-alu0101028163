class Paciente < Persona

attr_reader :cir_cintura, :cir_cadera, :cir_brazo, :pl_tricipital, :pl_bicipital, :pl_subescapular, :pl_suprailiaco
  def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, cir_brazo, pl_tricipital, pl_bicipital, pl_subescapular, pl_suprailiaco)
    super(nombre, peso, talla, edad, sexo)
    @cir_cintura = cir_cintura
    @cir_cadera = cir_cadera
    @cir_brazo = cir_brazo
    @pl_tricipital = pl_tricipital
    @pl_bicipital = pl_bicipital
    @pl_subescapular = pl_subescapular
    @pl_suprailiaco = pl_suprailiaco
  end
end
