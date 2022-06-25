//Excelente Platos: Sin Errores
class Plato {
	method peso() 
	method esAptoVegetariano()
	method valoracion()
	method esAbundante() = self.peso() > 250
}

class Provoleta inherits Plato {
	var peso
	const tieneEspecias
	
	override method peso() = peso
	override method esAptoVegetariano() = not tieneEspecias
	method esEspecial() = self.esAbundante() or tieneEspecias
	override method valoracion() = if (self.esEspecial()) {120} else {80}
}

class HamburguesaDeCarne inherits Plato {
	const pan 
	
	override method peso() = 250
	override method esAptoVegetariano() = false
	override method valoracion() = 60 + pan.valor()
}

object panIndustrial {
	const property valor = 0
}

object panCasero {
	const property valor = 20
}

object panMasaMadre {
	const property valor = 45
}

class HamburguesaVegetariana inherits HamburguesaDeCarne {
	const legumbre
	
	override method esAptoVegetariano() = true
	override method valoracion() = super() + 17.min(legumbre.size() * 2)
}

class Parrillada inherits Plato {
	const cortesDeCarne = []
	
	method agregarCorte(unCorte) { cortesDeCarne.add(unCorte) }
	override method peso() = cortesDeCarne.sum({ c => c.calidad() })
	override method esAptoVegetariano() = false
	method maximaCalidadDeCortes() = cortesDeCarne.max({ c => c.calidad() }).calidad() 
	method cantDeCortes() = cortesDeCarne.size()
	override method valoracion() = 0.max(15 * self.maximaCalidadDeCortes() - self.cantDeCortes()) 
}

class Corte {
	const property nombre
	const property calidad
	const property peso
}


