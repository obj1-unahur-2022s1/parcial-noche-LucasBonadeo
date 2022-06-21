import comidas.*

class Comensal {
	var peso
	const comidasIngeridas = []
	
	method leAgrada(unaComida)
	method comer(unaComida) { comidasIngeridas.add(unaComida) }
	method pesoTotalComidadIngeridad() = comidasIngeridas.sum({ c => c.peso() })	
	method estaSatisfecho() = self.pesoTotalComidadIngeridad() >= peso * 0.01
}

class Vegetariano inherits Comensal {
	override method leAgrada(unaComida) =
		unaComida.esAptoVegetariano() and unaComida.valoracion() > 85
	override method estaSatisfecho() = 
		super() and comidasIngeridas.all({ c => not c.esAbundante() })
}

class HambrePopular inherits Comensal {
	override method leAgrada(unaComida) = unaComida.esAbundante()
}

class PaladarFino inherits Comensal {
	override method leAgrada(unaComida) = 
		unaComida.peso().between(150, 300) and unaComida.valoracion() > 100
	override method estaSatisfecho() = 
		super() and comidasIngeridas.size().even()
}