object cuentaCorriente {
    var property saldo = 0     

    method depositar(monto) {
        saldo = saldo + monto
    }

    method extraer(monto) {
      self.validarMontoAExtraer(monto)
      saldo = saldo - monto
    }

    method validarMontoAExtraer(monto) {
      if (monto > saldo) { self.error('No hay fondos suficientes para realizar la extracción')}
    }
    
}

object cuentaConGastos {
  var property saldo = 0
  var property costoDeOperacion = 0 

    method depositar(monto) {
        self.validarMontoAlDepositar(monto)
        saldo = (saldo + monto) - costoDeOperacion
    }
    method validarMontoAlDepositar(monto) {
        if (monto > 1000) {self.error('Solo puede ingresar hasta 1000 pesos')}
    } 
    method extraer(monto) {
        saldo = saldo - monto
    }

}