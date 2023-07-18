import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final Function onClick;
  final String texto;
  const BotonAzul({super.key, required this.onClick, required this.texto});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onClick(),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          backgroundColor: const MaterialStatePropertyAll(Colors.blue),
          shape: const MaterialStatePropertyAll(StadiumBorder()),
        ),
        child: SizedBox(
          height: 45,
          width: double.infinity,
          child: Center(child: Text(texto)),
        ));
  }
}
