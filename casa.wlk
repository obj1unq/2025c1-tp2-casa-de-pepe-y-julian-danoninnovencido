import cosas.* 
import cuentasBancarias.*

object casaDePepeYJulian {
    const property cosasCompradas = [] //podria ser una lista,  que pasa si quiero comprar dos tiras de asado?
    var property cuenta = cuentaCorriente 

    method comprar(cosa){
        cosasCompradas.add(cosa)
        cuenta.extraer(cosa.precio())
    }

    method cantidadDeCosasCompradas() {return cosasCompradas.size()}

    method tieneAlgun(categoria) {return cosasCompradas.any({cosa => cosa.esDeCategoria(categoria)})}

    method vieneDeComprar(categoria) {
        self.validarCompras()
        return (cosasCompradas.last()).esDeCategoria(categoria)}

    method esDerrochona() {return self.precioTotalDeLasCompras() > 9000} 

    method precioTotalDeLasCompras() {return (self.listaDePrecios()).sum()}
    
    method listaDePrecios() { return cosasCompradas.map({cosa => cosa.precio()})} 
    
    method compraMasCara(){ 
        self.validarCompras()
        return cosasCompradas.find({cosa => cosa.precio() == self.cosaDeMayorValorDeLaLista()})
    } 

    method cosaDeMayorValorDeLaLista() {
        return self.listaDePrecios().max()
    } 

    method validarCompras(){
       if (cosasCompradas.isEmpty()){
        self.error("No hay compras hechas")}
    }

    method comprados(categoria) {
        return cosasCompradas.filter({cosa => cosa.categoria() == categoria})} 
    
    method malaEpoca() { return cosasCompradas.all({cosa => cosa.esDeCategoria(comida)})} 


// Refact el bloque del filter
    method queFaltaComprar(lista) { return lista.filter({ cosa => !cosasCompradas.contains(cosa)})} 

    method faltaComida() { return self.cantidadDeComidaEnLaCompra() <= 2 }

    method cantidadDeComidaEnLaCompra() { return cosasCompradas.count({ cosa => cosa.esDeCategoria(comida)})} 

    method categoriasCompradas() {
        return self.listaDeCosasCompradasSegunCategoria().withoutDuplicates()
    } 

    method listaDeCosasCompradasSegunCategoria() {
        return cosasCompradas.map({cosa => cosa.categoria()})
    } 

} 