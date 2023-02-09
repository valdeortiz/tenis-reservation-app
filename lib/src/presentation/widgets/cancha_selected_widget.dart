import 'package:provider/provider.dart';
import 'package:tenis/src/presentation/pages/home/constantes.dart';
import 'package:tenis/src/presentation/widgets/widgets.dart';
import 'package:tenis/src/provider/reservacion_prov.dart';

class CanchaListWidget extends StatelessWidget {
  const CanchaListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ReservacionProvider>(context);
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
            prov.setCancha(CANCHAS[index]);
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
              CheckBox(
                index: index,
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

class CheckBox extends StatelessWidget {
  const CheckBox({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
          onPressed: () {},
          icon: context.select((ReservacionProvider provider) =>
                  provider.cancha == CANCHAS[index].nombre)
              ? const Icon(
                  Icons.check_box,
                  color: Colors.white,
                )
              : const Icon(Icons.check_box_outline_blank)),
    );
  }
}
