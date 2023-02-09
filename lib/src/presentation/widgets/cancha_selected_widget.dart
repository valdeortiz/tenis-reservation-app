import 'package:tenis/src/presentation/pages/home/constantes.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';

class CanchaListWidget extends StatefulWidget {
  final TextEditingController controller;
  const CanchaListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CanchaListWidget> createState() => _CanchaListWidgetState();
}

class _CanchaListWidgetState extends State<CanchaListWidget> {
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
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              widget.controller.text = CANCHAS[index].nombre;
            });
          },
          child: Stack(
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
                    icon: widget.controller.text == CANCHAS[index].nombre
                        ? const Icon(
                            Icons.check_box,
                            color: Colors.white,
                          )
                        : const Icon(Icons.check_box_outline_blank)),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  CANCHAS[index].nombre,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ).paddingOnly(left: 65),
            ],
          ),
        ),
      ),
    );
  }
}
