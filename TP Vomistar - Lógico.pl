%1.
trabajaEnSector(maria, ventas)
trabajaEnSector(juan, ventas)
trabajaEnSector(roque, ventas)

trabajaEnSector(nora, compras)
trabajaEnSector(pedro, compras)

trabajaEnSector(felipe, administracion)
trabajaEnSector(hugo, administracion)
trabajaEnSector(ana, administracion)

%2.
mismoDepartamento(PersonaA, PersonaB):-
trabajaEnSector(PersonaA, Sector),
trabajaEnSector(PersonaB, Sector)


%3.
cargo(maria, empleado)
cargo(juan, cadete)
cargo(roque, pasante)
cargo(nora,empleado)
cargo(pedro, cadete)
cargo(felipe, empleado)
cargo(hugo, empleado)
cargo(ana, cadete)

% puestoSuperior(CargoSuperior, CargoInferior)
puestoSuperior(empleado, cadete)
puestoSuperior(empleado,pasante)

puedeDarOrdenes(PersonaA, PersonaB):-
trabajaEnSector(PersonaA, Sector)
trabajaEnSector(PersonaB, Sector)
cargo(PersonaA, PuestoA)
cargo(PersonaB, PuestoB)
puestoSuperior(PuestoA, PuestoB)

%4.
sellevanBien(PersonaA, PersonaB):
trabajaEnSector(PersonaA, Sector)
trabajaEnSector(PersonaB, Sector)
cargo(PersonaA, Puesto)
cargo(PersonaB, Puesto)


