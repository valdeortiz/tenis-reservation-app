import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tenis/src/presentation/pages/home/cancha_card_widget.dart';
import 'package:tenis/src/presentation/pages/nueva_reservacion/nueva_reservacion.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';
import 'package:tenis/src/provider/reservacion_prov.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          CupertinoButton(
            onPressed: () {},
            child: const Icon(Icons.notifications_active),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(NuevaReservacion.path),
          tooltip: "Nuevo agendamiento",
          child: const Icon(Icons.add_rounded)),
      body: Column(
        children: [
          Lottie.asset('assets/lottie/booking.json')
              .paddingSymmetric(vertical: 20.0),
          Center(
            child: Text(
              "Reservas",
              style: context.h3,
            ),
          ),
          gap18,
          (Provider.of<ReservacionProvider>(context).reservas.isEmpty)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/empy-list.json', repeat: false),
                    gap10,
                    Text(
                      "No hay reservaciones",
                      style: context.h6,
                    )
                  ],
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CanchaCard(
                          reserva: Provider.of<ReservacionProvider>(context)
                              .reservas[index]);
                    },
                    itemCount: Provider.of<ReservacionProvider>(context)
                        .reservas
                        .length,
                  ),
                ),
        ],
      ),
    );
  }
}
