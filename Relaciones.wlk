class Relacion
{
	var miembros = []
	var circuloDeAmigos = #{}
	var vigente = false
	
	constructor(unSim, otroSim)
	{
		self.iniciarRelacion(unSim,otroSim)
	}
	
	method circuloDeAmigos() {
		return circuloDeAmigos
	}
	
	method vigente()
	{
		return vigente
	}
	
	method iniciarRelacion(unSim, otroSim)
	{
		miembros.addAll([unSim,otroSim])
		
		circuloDeAmigos.addAll(unSim.amigos())
		circuloDeAmigos.addAll(otroSim.amigos())
		
		self.vincularSims()
		
		vigente = true
	}
	
	method vincularSims()
	{
		miembros.filter({miembro => miembro.estaEnPareja()}).forEach({miembro => miembro.terminarRelacion()})
		miembros.forEach({miembro => miembro.relacion(self)})
	}
	
	
	method terminarRelacion()
	{
		var miembro1 = miembros.head()
  		var miembro2 = miembros.reverse().head()
  		
  		miembro1.relacion(null)
  		miembro2.relacion(null)
		vigente = false
	}
	
	method reiniciarRelacion()
	{
		self.vincularSims()
		vigente = true
	}
	
	
	method laRelacionFunciona()
	{
		var miembro1 = miembros.head()
  		var miembro2 = miembros.reverse().head()
		
		return (self.seAtraen(miembro1, miembro2))
	}
	
	method seAtraen(unSim, otroSim)
	{
		return unSim.leAtrae(otroSim) && otroSim.leAtrae(unSim)
	}
	
	method sePudreTodo()
	{
		return !self.laRelacionFunciona() && self.leGustaElAmigo()
	}
	
	method leGustaElAmigo()
	{
		return miembros.any({miembro => circuloDeAmigos.any({amigo => miembro.leAtrae(amigo)})})
	}
	
	
	method parejaDe(miembro)
	{
		return (miembros.find({pareja => pareja != miembro}))
	}
	
	 method miembros()
 	{
  		return miembros
 	}
}