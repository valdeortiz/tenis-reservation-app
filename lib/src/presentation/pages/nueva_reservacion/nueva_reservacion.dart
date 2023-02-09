import 'package:tenis/src/presentation/widgets/cancha_selected_widget.dart';
import 'package:tenis/src/presentation/widgets/custom_text_field.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';
import 'package:tenis/src/utils/dialog_helper.dart';

class NuevaReservacion extends StatelessWidget {
  NuevaReservacion({super.key});
  static String path = 'nueva';
  TextEditingController controller = TextEditingController();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController canchaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              style:
                  TextStyle(color: Palette.gray2, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 10,
            ),
            CanchaListWidget(controller: canchaController),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Selecciona la fecha",
              style:
                  TextStyle(color: Palette.gray2, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: dateInputController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2050));

                if (pickedDate != null) {
                  dateInputController.text = pickedDate.toString();
                }
              },
              hint: "fecha",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Ingresa el nombre",
              style:
                  TextStyle(color: Palette.gray2, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: controller,
              hint: "Nombre",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onTap: () {
                  if (controller.text.isNotEmpty &&
                      dateInputController.text.isNotEmpty &&
                      canchaController.text.isNotEmpty) {
                    DialogHelper.showSuccess(
                        "${controller.text} - ${dateInputController.text} - ${canchaController.text}");
                    return;
                  }
                  String error = '';
                  if (controller.text.isEmpty) {
                    error += 'Nombre vacio';
                  }
                  if (dateInputController.text.isEmpty) {
                    error += ' fecha vacio';
                  }
                  if (canchaController.text.isEmpty) {
                    error += ' cancha no seleccionado';
                  }
                  DialogHelper.showError(error);
                  // show dialog
                },
                label: "Reservar")
          ],
        ),
      ),
    );
  }
}
