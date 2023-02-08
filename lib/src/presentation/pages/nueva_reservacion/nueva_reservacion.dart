import 'package:tenis/src/presentation/pages/home/constantes.dart';
import 'package:tenis/src/presentation/widgets/custom_text_field.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';

class NuevaReservacion extends StatelessWidget {
  NuevaReservacion({super.key});
  static String path = 'nueva';
  TextEditingController controller = TextEditingController();
  TextEditingController dateInputController = TextEditingController();

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
            const CanchaListWidget(),
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
            CustomButton(
                onTap: () {
                  String error = '';
                  if (controller.text.isEmpty) {
                    error += 'Nombre vacio';
                    print("Error de nombre vacio");
                  }
                  if (dateInputController.text.isEmpty) {
                    error += 'fecha vacio';
                    print("Error de fech vacio");
                  }
                  // show dialog
                },
                label: "Reservar")
          ],
        ),
      ),
    );
  }
}

class CanchaListWidget extends StatelessWidget {
  const CanchaListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: CANCHAS.length,
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(CANCHAS[index].imagen),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_box,
                      color: Colors.white,
                    )))
          ],
        ),
      ),
    );
  }
}
