import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tenis/src/models/reservacion.dart';
import 'package:tenis/src/presentation/pages/nueva_reservacion/nueva_reservacion.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';
import 'package:tenis/src/provider/reservacion_prov.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final prov = Provider.of<ReservacionProvider>(context, listen: false)
    //   ..getReservaciones();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          CupertinoButton(
            onPressed: () => null,
            child: const Icon(Icons.notifications_active),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(NuevaReservacion.path),
          child: const Icon(Icons.add_rounded)),
      body: Column(
        children: [
          Lottie.asset('assets/lottie/booking.json')
              .paddingSymmetric(vertical: 20.0),
          Center(
            child: Text(
              "Reservas",
              style: context.h5,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (Provider.of<ReservacionProvider>(context)
                    .reservas
                    .isEmpty) {
                  return loadingIndicator;
                }
                return CanchaCard(
                    reserva: Provider.of<ReservacionProvider>(context)
                        .reservas[index]);
              },
              itemCount:
                  Provider.of<ReservacionProvider>(context).reservas.length,
            ),
          ),
        ],
      ),
    );
  }
}

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
                    // const SizedBox(width: 32),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: const [
                    //     Text(
                    //       'Reservaciones disponibles',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     SizedBox(height: 4),
                    //     Text('Tenis Inc'),
                    //   ],
                    // )
                  ],
                ),
              ],
            )));
  }
}
