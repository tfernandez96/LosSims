class TrabajoFormal
{
	var sueldo
	var felicidadAfectada
	
	constructor(suel,feli)
	{
		sueldo 				= suel
		felicidadAfectada 	= feli
	}
	
	 method trabajar(sim)
 	{
  		sim.variarFelicidad(felicidadAfectada)
  		sim.ganarDinero(sueldo) 
 	}
}

class TrabajoCopado inherits TrabajoFormal
{
 	constructor(sueldo, felicidad) = super(sueldo,felicidad)
}

class TrabajoAburrido inherits TrabajoFormal
{
 	constructor(sueldo, felicidad) = super(sueldo,-felicidad)
}

class TrabajoMercenario 
{
 	method trabajar(sim)
 	{
 		sim.ganarDinero(((sim.dinero())* 0.02)+ 100)
 	}
}
