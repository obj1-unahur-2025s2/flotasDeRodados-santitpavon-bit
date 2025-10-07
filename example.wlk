import wollok.vm.*
class Corsa {
  const property color 

  method capacidad() = 4
  method velocidadMaxima() = 150 
  method peso() = 1300 
}
class Kwid {
  var tieneTanqueDeGas 

  method agregarTanque() {
    tieneTanqueDeGas = true
  }
  method quitarTanque() {
    tieneTanqueDeGas = false
  }
  method tieneTanqueDeGas() = tieneTanqueDeGas
  method capacidad() =
    if(tieneTanqueDeGas) 3 else 4
  method velocidadMaxima() =
    if(tieneTanqueDeGas) 120 else 110
  method peso() =
    if(tieneTanqueDeGas) 1350 else 1200
  method color() = "Azul"
}
object trafic {
  var interior = comodo
  var motor =  pulenta

  method interior(unInterior) {
    interior = unInterior
  }
  method motor(unMotor) {
    motor = unMotor
  }
  method capacidad() = interior.capacidad()
  method velocidadMaxima() = motor.velocidadMaxima()
  method peso() = 4000 + interior.peso() + motor.peso()
  method color() = "Blanco"
}
object comodo {
  method peso() {
    return 700
  }
  method capacidad() {
    return 5
  }
}
object popular {
  method peso() {
    return 1000
  }
  method capacidad() {
    return 12
  }
}
object pulenta {
  method peso() {
    return 800
  }
  method velocidadMaxima() {
    return 130
  }
}
object bataton {
  method peso() {
    return 500
  }
  method velocidadMaxima() {
    return 80
  }
}
class AutoEspecial {
  const property capacidad 
  const property velocidadMaxima 
  const property peso 
  const property color     
}
class Dependencia {
  const property flota = #{}
  var property empleados 
  const property pedidos = #{}

  method agregarPedido(unPedido) {
    pedidos.add(unPedido)
  } 
  method quitarPedido(unPedido) {
    pedidos.remove(unPedido)
  }
  method agregarAFlota(rodado) {
    flota.add(rodado)
  }
  method quitarDeFlota(rodado) {
    flota.remove(rodado)
  }
  method pesoTotalFlota() =
    flota.sum({unRodado => unRodado.peso() })
  method estaBienEquipada() =
    flota.size() >= 3 && flota.all({unRodado => 
        unRodado.velocidadMaxima() <= 100})
  method capacidadTotalEnColor(color) {
  }
  method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()
  method rodadoMasRapido() = flota.max({unRodado => unRodado.velocidadMaxima()})
  method capacidadFaltante() = empleados - self.capacidadTotal()
  method capacidadTotal() = flota.sum()
  method esGrande() = empleados >= 40 && flota.size() >= 5
  method totalDePasajeros() =
    pedidos.sum({unPedido => unPedido})
  method cualesPedidosNoSonSatisfechos() =
    pedidos.filter({unPedido => unPedido.satisfaceElPedido()})//hacer en casa
  method todosLosPedidosSonIncompatibles(color) = 
    pedidos.all({unPedido => unPedido.esColorIncompatible(color)})
  method relajarATodos() {
    pedidos.forEach({unPedido => unPedido.relajar()})
  }
}
class Pedido {
  const property distancia
  var tiempoMaximo
  const property cantidadPasajeros 
  const property coloresIncompatibles

  method tiempoMaximo() = tiempoMaximo
  method velocidadRequerida() = distancia / tiempoMaximo
  method satisfaceElPedido(auto) =
    auto.velocidadMaxima() >= self.velocidadRequerida() + 10 &&
    auto.capacidad() >=cantidadPasajeros &&
    !coloresIncompatibles.contains(auto.color())
  method acelerar() {
    tiempoMaximo -= 1
  }
  method relajar(){
    tiempoMaximo += 1
  }
  method esColorIncompatible(color) =
    coloresIncompatibles.contains(color)
}
