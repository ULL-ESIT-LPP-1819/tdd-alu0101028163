
class Paciente_obeso < Paciente

  attr_reader :cir_cintura, :cir_cadera, :cir_brazo, :pl_tricipital, :pl_bicipital, :pl_subescapular, :pl_suprailiaco, :registro
    def initialize(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, cir_brazo, pl_tricipital, pl_bicipital, pl_subescapular, pl_suprailiaco)
      super(nombre, peso, talla, edad, sexo)
      @cir_cintura = cir_cintura
      @cir_cadera = cir_cadera
      @cir_brazo = cir_brazo
      @pl_tricipital = pl_tricipital
      @pl_bicipital = pl_bicipital
      @pl_subescapular = pl_subescapular
      @pl_suprailiaco = pl_suprailiaco
      @registro = Registro.new(nombre, peso, talla, edad, sexo, cir_cintura, cir_cadera, cir_brazo, pl_tricipital, pl_bicipital, pl_subescapular, pl_suprailiaco)
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

       s << "
       Circunferencia cintura: #{@cir_cintura}
       Circunferencia cadera: #{@cir_cadera}
       Circunferencia brazo: #{@cir_brazo}
       Pliegue tricipital: #{@pl_tricipital}
       Pliegue bicipital: #{@pl_bicipital}
       Pliegue subescapular: #{@pl_subescapular}
       Pliegue suprailiaco: #{@pl_suprailiaco}"

       s
    end

end
