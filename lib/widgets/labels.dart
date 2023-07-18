import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final Function onTap;
  final String textoGris;
  final String textoAzul;

  const Labels(
      {super.key,
      required this.onTap,
      required this.textoGris,
      required this.textoAzul});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        textoGris,
        style: const TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
      ),
      const SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () => onTap(),
        child: Text(
          textoAzul,
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
