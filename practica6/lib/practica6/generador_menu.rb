def peso_teorico(talla)
  peso_teorico_ideal = (talla - 150) * 0.75 + 50
end

def gasto_basal(peso,talla,edad,sexo)
  gasto_energetico_basal = 0
  if sexo == 0 #Es un hombre
    gasto_energetico_basal = (10*peso) + (6.25*talla) - (5*edad) + 5
  else
    gasto_energetico_basal = (10*peso) + (6.25*talla) - (5*edad) - 161
  end
  gasto_energetico_basal
end
