#Generar una dieta a partir de los siguientes datos:
#a) Peso del usuario
#b) Estatura del usuario 
#c) Actividad (activa, moderada, sedentaria)
#d) Podriamos poner un apartado de alergias 
#e) sexo (vi que las calorias no son iguales para hombres y mujeres)


#Primero hacemos varios data.frame que tenga todos los alimentos de un tipo (proteinas, lipidos, carbohidratos) para después hacer 
#la función que va a recolectar los datos de estos data.frame
proteinas_df <- data.frame(
  alimento = c("pechuga de pollo", "carne de res", "huevo", "salmon", "tofu", "lomo de cerdo", "pavo", "atun", "filete de tilapia"),
  calorias_por_100g = c(165, 250, 155, 208, 76, 242, 189, 184, 96),
  proteinas_en_100g = c(31, 26, 13, 20, 8, 27, 29, 29, 20),
  alergenos = c("ninguno", "ninguno", "ninguno", "pescado", "ninguno", "ninguno", "ninguno", "pescado", "pescado")
)

carbohidratos_df <- data.frame(
  alimento = c("arroz", "avena", "pasta integral", "pan", "quinoa cocida", "papa", "camote", "platano"),
  calorias_por_100g = c(130, 360, 131, 265, 120, 77, 86, 89),
  carbohidratos_en_100g = c(28, 64, 25, 50, 21, 17, 20, 23),
  alergenos = c("ninguno", "ninguno", "gluten", "gluten", "ninguno", "ninguno", "ninguno", "ninguno")
)

lipidos_df <- data.frame(
  alimento = c("aguacate", "aceite_oliva", "nueces", "almendras", "crema_cacahuate", "semillas_girasol"),
  calorias_por_100g = c(160, 884, 654, 576, 588, 584),
  grasas_por_100g = c(15, 100, 65, 50, 50, 51),
  alergenos = c("ninguno", "ninguno", "frutos_secos", "frutos_secos", "frutos_secos", "ninguno")
)

lacteos_df <- data.frame(
  alimento = c("leche lala", "yogurt natural", "queso panela", "requeson", "leche de almendras"),
  calorias_por_100g = c(44, 63, 274, 120, 17),
  proteinas_por_100g = c(5, 10, 18, 11, 0.62),
  alergenos = c("lacteos", "lacteos", "lacteos", "lacteos", "ninguno")
)

frutas_df <- data.frame(
  alimento = c("manzana", "platano", "naranja", "fresa", "uva", "melon", 
               "sandia", "piña", "mango", "kiwi", "pera", "durazno",
               "ciruela", "cereza", "arandanos", "frambuesa", "zarzamora"),
  calorias_por_100g = c(52, 89, 47, 32, 69, 34, 30, 50, 60, 61, 57, 39, 
                        46, 50, 57, 52, 43),
  carbohidratos_por_100g = c(14, 23, 12, 8, 18, 8, 8, 13, 15, 15, 15, 10,
                             11, 12, 14, 12, 10),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)

verduras_df <- data.frame(
  alimento = c("brocoli", "espinaca", "zanahoria", "tomate", "pepino", 
               "lechuga", "coliflor", "pimiento", "calabaza", "berenjena", 
               "apio", "champinones", "alcachofa","esparrago", "col_bruselas",
               "jicama", "remolacha"),
  calorias_por_100g = c(34, 23, 41, 18, 15, 15, 25, 26, 26, 25, 
                        16, 22, 47, 20, 43, 38, 43),
  carbohidratos_por_100g = c(7, 4, 10, 4, 3, 3, 5, 6, 7, 6, 
                             3, 3, 11, 4, 9, 8.8, 9.6),
  proteinas_por_100g = c(2.8, 2.9, 0.9, 0.9, 0.7, 1.4, 2.0, 1.0, 1.0, 1.0,
                         0.7, 3.1, 3.3, 2.2, 3.4, 0.7, 1.6),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", 
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)
#lo valores nutrimentales (aproximaciones) se obtuvieron de busquedas a través de internet, estos valores pueden cambiar según la pagina web de donde saques los datos
#Tiene que calcular: calorias y cantidad de proteina 

dieta <- function(){
  #PREGUNTAR DATOS AL USUARIO
edad<- as.numeric(readline(prompt = "Bienvenido al creador de dietas 
favor de responder todas las preguntas en minusculas y sin acentos. Qué edad tiene?"))
sexo<- readline(prompt = "¿Cual es su sexo? (femenino o masculino)")
peso<- as.numeric(readline(prompt = "Escriba su peso en kilogramos. (Ejemplo: 89)"))
altura<- as.numeric(readline(prompt = "Escriba su altura en centimetros. (Ejemplo: 156)"))
actividad<- readline(prompt = "¿Cual es tu nivel de actividad? 
Poco o ningun ejercicio
ejercicio ligero (1-3 días) 
ejercicio moderado (3-5 días),
ejercicio fuerte (6-7 días)
ejercicio muy fuerte (2 veces por dia)")
alergia1<- readline(prompt = "Tiene alergia a alguno de estos grupos alimentarios? 
Opciones: lacteos, gluten, frutos_secos, pescado o ninguno, escriba solo una")
alergia2<- readline(prompt = "¿Tiene una segunda alergia? : Si no hay otra, escriba (ninguno)")
cambio_peso<-readline(prompt="Quiere subir, bajar, o mantener su peso? (Ejemplo: subir, bajar, mantener)")

  #CALCULAR LAS CALORIAS QUE DEBE COMER
  ##hacemos la formula para sacar las calorias que debes de consumir según el peso, la altura, la edad y la actividad fisica
  #los valores obtenido de esta fórmula se le denomina "tasa metabolica basal"
  #Las formulas fueron sacadas de la plataforma del Estado peruano

  if(sexo=="masculino" & actividad== "poco o ningun ejercicio"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.2
  }else if(sexo== "masculino" & actividad== "ejercicio ligero"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.375
  }else if(sexo=="masculino" & actividad== "ejercicio moderado"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.55
  }else if(sexo=="masculino" & actividad== "ejercicio fuerte"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.725
  }else if(sexo=="masculino" & actividad== "ejercicio muy fuerte"){hombres_TMB<- (10*peso)+(6.25*altura)-(5*edad)+5; calorias<- hombres_TMB*1.9
  }else if(sexo=="femenino" & actividad== "poco o ningun ejercicio"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.2 
  }else if(sexo=="femenino" & actividad== "ejercicio ligero"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.375
  }else if(sexo=="femenino" & actividad== "ejercicio moderado"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.55
  }else if(sexo=="femenino" & actividad== "ejercicio fuerte"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.725
  }else if(sexo=="femenino" & actividad== "ejercicio muy fuerte"){mujeres_TMB<- (10*peso)+(6.25*altura)-(5*edad)-161; calorias<-mujeres_TMB*1.9
  }else{print("Los datos proporcionado no han sido validos, favor de escribir las opciones correctamente:")
    return()
  }

##Después de esto hay que sacar las calorías que debe consumir la persona ajustandolo a si quiere bajar o subir de peso
##valores de multiplicación obtenidos de la página web "fit generation"

if(cambio_peso=="bajar"){calorias_ajustado<-calorias*0.8
}else if(cambio_peso=="subir"){calorias_ajustado<-calorias*1.15
}else{calorias_ajustado<-calorias

}
###Después de eso hay que sacar las proporciones de carbohidratos, proteinas y lipidos que debe tener su dieta
#las cantidades se sacan orque a partir de las calorias totales aproximadamente 50% deben provenir de carbohidratos, 30% de lípidos, 20% de proteínas
#luego se dividen para sacar la cantidad en gramos

cantidad_carbohidratos<- (calorias_ajustado*0.5)/4
cantidad_proteínas<- calorias_ajustado*0.2/4
cantidad_lípidos<-calorias_ajustado*0.3/9

##Después hay que filtrar los alimentos, en caso de que se tenga una alergia, esto porque si alguien tiene una alergia
#no elimine el dato de la tabla original y no se vayan borrando cosas conforme los usuarios modifiquen

proteinasalergias <- proteinas_df
carbohidratosalergias <- carbohidratos_df
lipidosalergias <- lipidos_df
lacteosalergias <- lacteos_df

###Genere unas condicionales para que filtre los alimentos si es que la respuesta en
#alergia1/2 sea diferente a ninguna. Asi es facil generar el menu mas adelante y filtra

if(alergia1 != "ninguno"){
  proteinasalergias <- subset(proteinasalergias, alergenos != alergia1)
  carbohidratosalergias<- subset(carbohidratosalergias, alergenos != alergia1)
  lipidosalergias <- subset(lipidosalergias, alergenos != alergia1)
  lacteosalergias <- subset(lacteosalergias, alergenos != alergia1)
}

if(alergia2 != "ninguno"){
  proteinasalergias <- subset(proteinasalergias, alergenos != alergia2)
  carbohidratosalergias<- subset(carbohidratosalergias, alergenos != alergia2)
  lipidosalergias <- subset(lipidosalergias, alergenos != alergia2)
  lacteosalergias <- subset(lacteosalergias, alergenos != alergia2)
}

###Elegir al azar 1 solo grupo de alimentos... A excepcion de las verduras, de ese elige 2 
proteina<- proteinasalergias[sample(nrow(proteinasalergias), 1), ]
carbohidrato<- carbohidratosalergias[sample(nrow(carbohidratosalergias), 1), ]
lipido<- lipidosalergias[sample(nrow(lipidosalergias), 1), ]
lacteo<- lacteosalergias[sample(nrow(lacteosalergias), 1), ]
verdura<- verduras_df[sample(nrow(verduras_df), 2), ]
fruta<- frutas_df[sample(nrow(frutas_df), 1), ]

###Acomodar las porciones (gr) segun el requerimiento
porcion_proteina<- round((cantidad_proteínas/ proteina$proteinas_en_100g) * 100)
porcion_carbohidrato<- round((cantidad_carbohidratos/ carbohidrato$carbohidratos_en_100g) * 100)
porcion_lipido<- round((cantidad_lípidos/ lipido$grasas_por_100g) * 100)

###Imprimir la dieta. Estuve intentando como mandar una "impresion" como tipo grafica
#y solo hice una grafica sin datos... No se si haya otra manera, hasta ahorita no he 
#encontrado nada. 

plot(0:30, type = "n", xlab = "", ylab = "", axes = F)
     ### Para sacar las porciones solo hice una regla de 3, si 100gr de este alimento
#tienen tantos gr de proteina, cuantos gramos necesito para cumplir tal. 
text(10,27, paste("-----CANTIDADES REQUERIDAS-----"))
text(10,25, paste("Calorias requeridas:", round(calorias_ajustado),"kcal"))
text(10,23, paste("Proteina requerida:", porcion_proteina, "g"))
text(10,21, paste("Carbohidratos requeridos:", porcion_carbohidrato, "g"))
text(10,19, paste("Lipidos requeridos:", porcion_lipido, "g"))
text(10,17, paste("Porcion de lacteos: 100g/ml"))
text(10,15, paste("Porcion de frutas y verduras: 100g"))
text(10,10, paste("-----MENÚ RECOMENDADO-----"))
text(10,8, paste(porcion_proteina, "g de", proteina$alimento, "acompañado de"))
text(10,6, paste(porcion_carbohidrato, "g de", carbohidrato$alimento, "y"))
text(10,4, paste(porcion_lipido, "g de", lipido$alimento, "agregue tambien 100g/ml de"))
text(10,2, paste(lacteo$alimento, ",", "100 gr de", fruta$alimento, "y 100g de c/u, de"))
text(10,0, paste(verdura$alimento, "Recuerde que esta dieta debe complementarse con al menos un poco de actividad fisica"))
}

dieta ()
