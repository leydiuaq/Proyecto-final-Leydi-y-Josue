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
  calorias_en_100g = c(165, 250, 155, 208, 76, 242, 189, 184, 96),
  proteinas_en_100g = c(31, 26, 13, 20, 8, 27, 29, 29, 20),
  alergenos = c("ninguno", "ninguno", "ninguno", "pescado", "ninguno", "ninguno", "ninguno", "pescado", "pescado")
)

carbohidratos_df <- data.frame(
  alimento = c("arroz", "avena", "pasta integral", "pan multigrano cero", "quinoa cocida", "papa blanca", "camote", "Tostadas_de_nopal"),
  calorias_en_100g = c(130, 360, 131, 156, 120, 77, 86, 191),
  proteinas_en_100g = c(2.66, 16.89, 5.9, 6, 5.01, 1.68, 1.89, 4.5),
  carbohidratos_en_100g = c(28, 64, 25, 27.7, 21, 17, 20, 38.16),
  alergenos = c("ninguno", "ninguno", "gluten", "gluten", "ninguno", "ninguno", "ninguno", "ninguno")
)

lipidos_df <- data.frame(
  alimento = c("aguacate", "aceite_oliva", "nueces", "almendras", "crema_cacahuate", "semillas_girasol"),
  calorias_en_100g = c(160, 884, 654, 576, 588, 584),
  grasas_en_100g = c(15, 100, 65, 50, 50, 51),
  alergenos = c("ninguno", "ninguno", "frutos_secos", "frutos_secos", "frutos_secos", "ninguno")
)

lacteos_df <- data.frame(
  alimento = c("leche lala", "yogurt natural", "queso panela", "requeson", "leche de almendras"),
  calorias_en_100g = c(44, 63, 274, 120, 17),
  proteinas_en_100g = c(5, 10, 18, 11, 0.62),
  alergenos = c("lacteos", "lacteos", "lacteos", "lacteos", "ninguno")
)

frutas_df <- data.frame(
  alimento = c("manzana", "platano", "naranja", "fresa", "uva", "melon", 
               "sandia", "piña", "mango", "kiwi", "pera", "durazno",
               "ciruela", "cereza", "arandanos", "frambuesa", "zarzamora"),
  calorias_en_100g = c(52, 89, 47, 32, 69, 34, 30, 50, 60, 61, 57, 39, 
                        46, 50, 57, 52, 43),
  carbohidratos_en_100g = c(14, 23, 12, 8, 18, 8, 8, 13, 15, 15, 15, 10,
                             11, 12, 14, 12, 10),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)

verduras_df <- data.frame(
  alimento = c("brocoli", "espinaca", "zanahoria", "tomate", "pepino", 
               "lechuga", "coliflor", "pimiento", "calabaza", "berenjena", 
               "apio", "champinones", "alcachofa","esparrago", "col_bruselas",
               "jicama", "remolacha", "ejotes", "chayote"),
  calorias_en_100g = c(34, 23, 41, 18, 15, 15, 25, 26, 26, 25, 
                        16, 22, 47, 20, 43, 38, 43, 18, 17),
  carbohidratos_en_100g = c(7, 4, 10, 4, 3, 3, 5, 6, 7, 6, 
                             3, 3, 11, 4, 9, 8.8, 9.6, 3.9),
  proteinas_en_100g = c(2.8, 2.9, 0.9, 0.9, 0.7, 1.4, 2.0, 1.0, 1.0, 1.0,
                         0.7, 3.1, 3.3, 2.2, 3.4, 0.7, 1.6, 1, 0.82),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", 
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)
#lo valores nutrimentales (aproximaciones) se obtuvieron de busquedas a través de internet, estos valores pueden cambiar según la pagina web de donde saques los datos
#Tiene que calcular: calorias y cantidad de proteina 

dieta <- function(){
  #PREGUNTAR DATOS AL USUARIO
nombre<- readline(prompt = "Bienvenido al creador de dietas, ¿Cuál es su nombre?")
edad<- as.numeric(readline(prompt = "Mucho gusto, favor de responder todas las preguntas en minusculas y sin acentos. 
                           Qué edad tiene?"))
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
cantidad_proteinas<- calorias_ajustado*0.2/4
cantidad_lipidos<-calorias_ajustado*0.3/9

##Después hay que filtrar los alimentos, en caso de que se tenga una alergia, esto porque si alguien tiene una alergia
#no elimine el dato de la tabla original y no se vayan borrando cosas conforme los usuarios modifiquen

proteinasalergias <- proteinas_df
carbohidratosalergias <- carbohidratos_df
lipidosalergias <- lipidos_df
lacteosalergias <- lacteos_df

###Genere unas condicionales para que filtre los alimentos si es que la respuesta en
###alergia1 es que si tiene alguna

if(alergia1 == "gluten"){
  proteinasalergias <- subset(proteinasalergias, alergenos != "gluten")
  carbohidratosalergias<- subset(carbohidratosalergias, alergenos != "gluten")
  lipidosalergias <- subset(lipidosalergias, alergenos != "gluten")
  lacteosalergias <- subset(lacteosalergias, alergenos != "gluten")
} else if(alergia1 == "lacteos"){
  proteinasalergias <- subset(proteinasalergias, alergenos != "lacteos")
  carbohidratosalergias <- subset(carbohidratosalergias, alergenos != "lacteos")
  lipidosalergias <- subset(lipidosalergias, alergenos != "lacteos")
  lacteosalergias <- subset(lacteosalergias, alergenos != "lacteos")
} else if(alergia1 == "frutos_secos"){
  proteinasalergias <- subset(proteinasalergias, alergenos != "frutos_secos")
  carbohidratosalergias <- subset(carbohidratosalergias, alergenos != "frutos_secos")
  lipidosalergias <- subset(lipidosalergias, alergenos != "frutos_secos")
  lacteosalergias <- subset(lacteosalergias, alergenos != "frutos_secos")
} else if(alergia1 == "ninguno"){
  
} else{
  print("La alergia1 que proporcionó no es valida, favor de escribir correctamente
        el grupo: lacteos, gluten, pescado, frutos_secos o ninguno")
  return()
}

if(alergia2 == "gluten"){
  proteinasalergias <- subset(proteinasalergias, alergenos != "gluten")
  carbohidratosalergias<- subset(carbohidratosalergias, alergenos != "gluten")
  lipidosalergias <- subset(lipidosalergias, alergenos != "gluten")
  lacteosalergias <- subset(lacteosalergias, alergenos != "gluten")
} else if(alergia2 == "lacteos"){
  proteinasalergias <- subset(proteinasalergias, alergenos != "lacteos")
  carbohidratosalergias <- subset(carbohidratosalergias, alergenos != "lacteos")
  lipidosalergias <- subset(lipidosalergias, alergenos != "lacteos")
  lacteosalergias <- subset(lacteosalergias, alergenos != "lacteos")
} else if(alergia2 == "frutos_secos"){
  proteinasalergias <- subset(proteinasalergias, alergenos != "frutos_secos")
  carbohidratosalergias <- subset(carbohidratosalergias, alergenos != "frutos_secos")
  lipidosalergias <- subset(lipidosalergias, alergenos != "frutos_secos")
  lacteosalergias <- subset(lacteosalergias, alergenos != "frutos_secos")
} else if(alergia2 == "ninguno"){
  
} else{
  print("La alergia2 que proporcionó no es valida, favor de escribir correctamente
        el grupo: lacteos, gluten, pescado, frutos_secos o ninguno")
  return()
}

###como queremos dividir este menu en 3 comidas diferentes, calcularemos el aporte que necesita cada alimento. 
##PROTEINAS 100%
proteinas_desayuno<- cantidad_proteinas * 0.40
proteinas_comida<- cantidad_proteinas * 0.40
proteinas_cena<- cantidad_proteinas * 0.20

##CARBOHIDRATOS 100%
carbo_desayuno<- cantidad_carbohidratos *0.20
carbo_comida<- cantidad_carbohidratos *0.40 
carbo_cena<- cantidad_carbohidratos *0.40 

##LIPIDOS 100%
lipidos_comida<-cantidad_lipidos *0.50
lipidos_cena<- cantidad_lipidos *0.50 


while(TRUE){
###Elegir al azar 2 solo grupo de alimentos... Dividiendolo por tiempos (desayuno, comida y cena)
##DESAYUNO
desayunolacteo<- lacteosalergias[sample(nrow(lacteosalergias), 1), ]
desayunofruta<- frutas_df[sample(nrow(frutas_df), 1), ]

porciondesayunoproteina<- round(proteinas_desayuno/desayunolacteo$proteinas_en_100g * 100)
porciondesayunocarbohidrato<- round(carbo_desayuno/desayunofruta$carbohidratos_en_100g * 100)

##COMIDA
comidaproteina<- proteinasalergias[sample(nrow(proteinasalergias), 1), ]
comidacarbohidrato<- carbohidratosalergias[sample(nrow(carbohidratosalergias), 1), ]
comidalipido<- lipidosalergias[sample(nrow(lipidosalergias), 1), ]
comidaverdura<- verduras_df[sample(nrow(verduras_df), 2), ]

porcioncomidaproteina<- round(proteinas_comida/comidaproteina$proteinas_en_100g * 100)
porcioncomidacarbohidrato<- round(carbo_comida/comidacarbohidrato$carbohidratos_en_100g * 100)
porcioncomidalipido<- round(lipidos_comida/comidalipido$grasas_en_100g * 100)
porcioncomidaverdura<- rep(100, nrow(comidaverdura))

##CENA
cenaproteina<- proteinasalergias[sample(nrow(proteinasalergias), 1), ]
cenacarbohidrato<- carbohidratosalergias[sample(nrow(carbohidratosalergias), 1), ]
cenalipido<- lipidosalergias[sample(nrow(lipidosalergias), 1), ]
cenaverdura<- verduras_df[sample(nrow(verduras_df), 2), ]

porcioncenaproteina<- round(proteinas_cena/cenaproteina$proteinas_en_100g * 100)
porcioncenacarbohidrato<-round(carbo_cena/cenacarbohidrato$carbohidratos_en_100g * 100)
porcioncenalipido<- round(lipidos_cena/cenalipido$grasas_en_100g * 100)
porcioncenaverdura<- rep(100, nrow(cenaverdura))
  
#Dar un "borrador" de la dieta final
cat("Desayuno:")
cat(paste(porciondesayunoproteina, "g de",desayunolacteo$alimento, "acompañado de", porciondesayunocarbohidrato,
            "g de", desayunofruta$alimento))



cat("Comida:")
cat(paste(porcioncomidaproteina, "g de", comidaproteina$alimento, "acompañado de", porcioncomidacarbohidrato,
            "g de", comidacarbohidrato$alimento, porcioncomidalipido, "g de", comidalipido$alimento, porcioncomidaverdura[1],
            "g de", comidaverdura$alimento[1], "y", porcioncomidaverdura[2], "g de", comidaverdura$alimento[2]))



cat("Cena:")
cat(paste(porcioncenaproteina, "g de", cenaproteina$alimento, "acompañado de", porcioncenacarbohidrato,
            "g de", cenacarbohidrato$alimento, porcioncenalipido, "g de", cenalipido$alimento, porcioncenaverdura[1],
            "g de", cenaverdura$alimento[1], "y", porcioncenaverdura[2], "g de", cenaverdura$alimento[2]))


###Mandar un pdf al usuario con su dieta si le gustó.
pregunta<- readline(prompt = "Estas conforme con este menú? (si/no)")



}


}

dieta ()










