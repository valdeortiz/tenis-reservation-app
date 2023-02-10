import 'package:provider/provider.dart';
import 'package:tenis/src/domain/domains.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';
import 'package:tenis/src/provider/reservacion_prov.dart';
import 'package:tenis/src/utils/dialog_helper.dart';

class CanchaCard extends StatelessWidget {
  const CanchaCard({super.key, required this.reserva});
  final Reservacion reserva;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8.0,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            height: 200,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50, //we give the image a radius of 50
                      backgroundImage: AssetImage(reserva.cancha.imagen),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      //CrossAxisAlignment.end ensures the components are aligned from the right to left.
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          width: 150,
                          color: Palette.gray4,
                          height: 2,
                        ),
                        const SizedBox(height: 4),
                        Text(reserva.fecha.stringFormat()),
                        Text(reserva.nombreUsuario),
                        Text('${reserva.porcentajeLluvia}% de lluvia'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cancha ${reserva.cancha.nombre}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // gap16,
                    GestureDetector(
                      onTap: () async {
                        final data = await DialogHelper.ifDialog(
                          context: context,
                          // accept: () => ,
                          title: "Eliminar reserva",
                          message:
                              "Esta seguro que desea eliminar la reserva ?",
                        );
                        if (data) {
                          Provider.of<ReservacionProvider>(context,
                                  listen: false)
                              .eliminarReserva(reserva);
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Eliminar reservacion',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.red[300],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )));
  }
}
