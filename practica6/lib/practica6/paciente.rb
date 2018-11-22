class Paciente < Persona

attr_reader :cir_cintura, :cir_cadera, :cir_brazo, :pl_tricipital, :pl_bicipital, :pl_subescapular, :pl_suprailiaco
  def initialize(nombre, peso, talla, edad, sexo, cir_cintura = nil, cir_cadera = nil, cir_brazo = nil, pl_tricipital = nil, pl_bicipital = nil, pl_subescapular = nil, pl_suprailiaco = nil)
    super(nombre, peso, talla, edad, sexo)
    @cir_cintura = cir_cintura
    @cir_cadera = cir_cadera
    @cir_brazo = cir_brazo
    @pl_tricipital = pl_tricipital
    @pl_bicipital = pl_bicipital
    @pl_subescapular = pl_subescapular
    @pl_suprailiaco = pl_suprailiaco
  end

  def tiene_obesidad
    x = false
    if !cir_cintura.nil? and !cir_cadera.nil? and !cir_brazo.nil? and
       !pl_tricipital.nil? and !pl_bicipital.nil? and !pl_subescapular.nil? and
       !pl_suprailiaco.nil?
         x = true
    else
        x = false
    end
    x
  end

end
