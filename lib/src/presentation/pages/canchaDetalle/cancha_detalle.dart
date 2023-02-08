import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenis/src/models/cancha.dart';

class CanchaDetalle extends StatelessWidget {
  const CanchaDetalle({super.key});
  static String path = 'detalle';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Cancha;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservacion'),
        actions: [
          CupertinoButton(
            onPressed: () => null,
            child: const Icon(Icons.notifications_active),
          )
        ],
      ),
      body: Column(
        children: [
          Hero(
            tag: args.imagen,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(args.imagen),
                  fit: BoxFit.fill,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
