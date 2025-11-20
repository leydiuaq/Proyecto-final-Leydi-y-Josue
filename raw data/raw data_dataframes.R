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
                            3, 3, 11, 4, 9, 8.8, 9.6, 3.9, 4.5),
  proteinas_en_100g = c(2.8, 2.9, 0.9, 0.9, 0.7, 1.4, 2.0, 1.0, 1.0, 1.0,
                        0.7, 3.1, 3.3, 2.2, 3.4, 0.7, 1.6, 1, 0.82),
  alergenos = c("ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno",
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", 
                "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno", "ninguno")
)