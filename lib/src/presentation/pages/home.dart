import 'package:lottie/lottie.dart';
import 'package:tenis/src/models/cancha.dart';
import 'package:tenis/src/presentation/pages/canchaDetalle/cancha_detalle.dart';
import 'package:tenis/src/presentation/pages/home/constantes.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Lottie.asset('assets/lottie/booking.json')),
                Center(
                  child: Text(
                    "Realizar reserva",
                    style: context.h5,
                  ),
                ),
                CanchaCard(cancha: Canchas.canchaCesped),
                const SizedBox(
                  height: 10,
                ),
                CanchaCard(cancha: Canchas.canchaPiso),
                const SizedBox(
                  height: 10,
                ),
                CanchaCard(cancha: Canchas.canchaTierra),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}

class CanchaCard extends StatelessWidget {
  const CanchaCard({super.key, required this.cancha});
  final Cancha cancha;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(CanchaDetalle.path, arguments: cancha),
      child: Card(
          // color: Colors.grey[300],
          // color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            //set border radius more than 50% of height and width to make circle
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
                      Hero(
                        tag: cancha.imagen,
                        child: CircleAvatar(
                          radius: 50, //we give the image a radius of 50
                          backgroundImage: AssetImage(cancha.imagen),
                        ),
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
                          const Text('+595971921474'),
                          const Text('Asuncion - Paraguay'),
                          Text(cancha.dimensiones),
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
                            cancha.titulo,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text("Cancha ${cancha.subtitulo}"),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Reservaciones disponibles',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Tenis Inc'),
                        ],
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
