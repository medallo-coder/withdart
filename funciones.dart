import 'lista.dart';

//  Esta función busca el día con el precio más alto
Map<String, dynamic> diaPrecioMasAlto(List<int> listaDePrecios) {
  int precioMax = listaDePrecios[0];
  String diaMax = diasSemana[0];

  for (int i = 0; i < listaDePrecios.length; i++) {
    if (listaDePrecios[i] > precioMax) {
      precioMax = listaDePrecios[i];
      diaMax = diasSemana[i];
    }
  }

  // Retorna un Map con la información
  return {
    'dia': diaMax,
    'precio': precioMax,
  };
}

//  Esta función muestra los precios y usa la otra para encontrar el pico
void mostrarPreciosPorDia() {
  productos.forEach((producto, precios) {
    print(' $producto');

    int total = 0;

    for (int i = 0; i < precios.length; i++) {
      print('  ${diasSemana[i]}: \$${precios[i]}');
      total += precios[i];
    }

    var resultado = diaPrecioMasAlto(precios); // <-- Aquí aún pasamos 'precios'

    print(' Total semanal de $producto: \$${total}');
    print(' Día con mayor precio: ${resultado['dia']} (\$${resultado['precio']})');
    print('');
  });
}
