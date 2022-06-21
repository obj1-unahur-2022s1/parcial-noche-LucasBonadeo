import comidas.*
import comensales.*

object cocina {
	const comidas = []
	
	method agregarComida(unaComida) { comidas.add(unaComida) }
	method comidasVegetarianas() = comidas.filter({ c => c.esAptoVegetariano() }) 
	method comidasNoVegetarianas() = comidas.filter({ c => not c.esAptoVegetariano() }) 
	method tieneBuenaOfertaVegetariana() = 
		(self.comidasVegetarianas().size() - self.comidasNoVegetarianas().size()).abs() <= 2
	method platoFuerteCarnivoro() = self.comidasNoVegetarianas().max({ c => c.valoracion() })
	method comidasQueLeGustanA(unComensal) =
		comidas.filter({ c => unComensal.leAgrada(c) })
	method elegirPlatoPara(unComensal) =
		if ( self.comidasQueLeGustanA(unComensal).isEmpty() ) 
			{ self.error("No le gusta ninguna plato de la cocina") }
		else { unComensal.comer(self.comidasQueLeGustanA(unComensal).anyOne()) } 
}