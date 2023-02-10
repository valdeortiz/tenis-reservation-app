import 'package:provider/provider.dart';
import 'package:tenis/src/presentation/widgets/cancha_selected_widget.dart';
import 'package:tenis/src/presentation/widgets/custom_text_field.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';
import 'package:tenis/src/provider/reservacion_prov.dart';
import 'package:tenis/src/utils/dialog_helper.dart';

class NuevaReservacion extends StatelessWidget {
  const NuevaReservacion({super.key});
  static String path = 'nueva';

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ReservacionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva reserva'),
        actions: [
          CupertinoButton(
            onPressed: () => null,
            child: const Icon(Icons.notifications_active),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              "Seleccione la cancha",
              style: TextStyle(
                  color: Palette.gray2,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            gap10,
            const CanchaListWidget(),
            gap18,
            const Text(
              "Selecciona la fecha",
              style: TextStyle(
                  color: Palette.gray2,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            gap10,
            CustomTextField(
              controller: prov.dateInputController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050));

                if (pickedDate != null) {
                  if (prov.nroReservas(pickedDate) >
                      ReservacionProvider.nroReservasMaximas) {
                    DialogHelper.showError(
                        "Numero maximo de reservas, seleccione otra fecha");
                    return;
                  }
                  prov.setFecha(pickedDate);
                }
              },
              hint: "fecha",
            ),
            Text(prov.probabilidadLluvia != -1.0
                ? prov.probabilidadLluviaStr
                : "No se pudo obtener datos del clima en ese dia"),
            gap18,
            const Text(
              "Ingresa el nombre",
              style: TextStyle(
                  color: Palette.gray2,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
            gap10,
            CustomTextField(
              controller: prov.nombreController,
              hint: "Nombre",
            ),
            gap18,
            CustomButton(onTap: prov.reservar, label: "Reservar")
          ],
        ),
      ),
    );
  }
}
