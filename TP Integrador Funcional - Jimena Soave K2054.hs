--- Punto A ---
type Juguete = String
type Raza = String

data Perrito = Perrito {
  raza :: Raza,
  juguetes :: [Juguete],
  tiempoEstadia :: Int,  -- en minutos
  energia :: Int
} deriving (Show)

data Ejercicio = Ejercicio {
  actividad :: Perrito -> Perrito,
  duracion :: Int
}

data Guarderia = Guarderia {
  nombre :: String,
  rutina :: [Ejercicio]
}

jugar :: Perrito -> Perrito
jugar p = p { energia = max 0 (energia p - 10) }

ladrar :: Int -> Perrito -> Perrito
ladrar cantLadridos p = p { energia = energia p + cantLadridos `div` 2 }

regalar :: Juguete -> Perrito -> Perrito
regalar juguete p = p { juguetes = juguete : juguetes p }

diaDeSpa :: Perrito -> Perrito
diaDeSpa p
  | tiempoEstadia p >= 50 || raza p `elem` ["dálmata", "pomerania"] =
      (regalar "peine de goma" p) { energia = 100 }
  | true  = p

diaDeCampo :: Perrito -> Perrito
diaDeCampo p = p { juguetes = drop 1 (juguetes p) }

zara :: Perrito
zara = Perrito {
  raza = "dálmata",
  juguetes = ["pelota", "mantita"],
  tiempoEstadia = 90,
  energia = 80
}


guarderiaPdePerritos :: Guarderia
guarderiaPdePerritos = Guarderia {
  nombre = "P de Perritos",
  rutina = [
    Ejercicio jugar 30,
    Ejercicio (ladrar 18) 20,
    Ejercicio (regalar "pelota") 0,
    Ejercicio diaDeSpa 120,
    Ejercicio diaDeCampo 720
  ]
}

--- Parte B --

tiempoTotalRutina :: [Ejercicio] -> Int
tiempoTotalRutina = sum . map duracion

puedeEstar :: Perrito -> Guarderia -> Bool
puedeEstar perro guarderia = tiempoEstadia perro > tiempoTotalRutina (rutina guarderia)

esResponsable :: Perrito -> Bool
esResponsable p = length (juguetes (diaDeCampo p)) > 3


hacerRutina :: Perrito -> Guarderia -> Perrito
hacerRutina perro guarderia
  | tiempoTotalRutina (rutina guarderia) <= tiempoEstadia perro =
      aplicarRutina perro (rutina guarderia)
  | true  = perro



quedaCansado :: Guarderia -> Perrito -> Bool
quedaCansado guarderia perro = energia (hacerRutina perro guarderia) < 5

perrosCansados :: Guarderia -> [Perrito] -> [Perrito]
perrosCansados guarderia = filter (quedaCansado guarderia)

-- Parte C ---
