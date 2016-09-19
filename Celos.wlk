class Celos 
{
	method ponerCeloso(sim) 
	{
  		sim.variarFelicidad(-10)
 	 	self.eliminarAmigosPorCelos(sim)
 	}
 
 	method eliminarAmigosPorCelos(sim)
}

class CelosPorPlata inherits Celos 
{
 	override method eliminarAmigosPorCelos(sim) 
 	{
  		sim.eliminarAmigosPorCriterio({amigo => sim.tieneMasDinero(amigo)})
 	}
}

class CelosPorPopularidad inherits Celos 
{ 
 	override method eliminarAmigosPorCelos(sim) 
 	{
  		sim.eliminarAmigosPorCriterio({amigo => sim.esMasPopular(amigo)})
	}
}

class CelosPorPareja inherits Celos 
{
 	override method eliminarAmigosPorCelos(sim) 
 	{
 		if(sim.estaEnPareja())
  			sim.eliminarAmigosDePareja()
  		else
  			error.throwWithMessage("No tengo pareja")	
 	}
}