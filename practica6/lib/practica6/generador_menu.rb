def peso_teorico(talla)
  peso_teorico_ideal = (talla - 150) * 0.75 + 50
end


GASTO_BASAL = lambda do |peso,talla,edad,sexo|
            gasto_energetico_basal = 0
            if sexo == 0 #Es un hombre
               gasto_energetico_basal = (10*peso) + (6.25*talla) - (5*edad) + 5
            else
               gasto_energetico_basal = (10*peso) + (6.25*talla) - (5*edad) - 161
            end
               gasto_energetico_basal
            end

def efecto_termogeno(peso,talla,edad,sexo, procedure)
  efecto_termogeno = procedure.call(peso,talla,edad,sexo) * 0.10
end

def gasto_actividad_fisica(peso,talla,edad,sexo, procedure, factor)
  gasto_actividad = procedure.call(peso,talla,edad,sexo) * factor
end

# ¿Factor de actividad física es un atributo
# que le incluyo a la clase Registro?

# Tengo que utilizar procs / lambdas?
