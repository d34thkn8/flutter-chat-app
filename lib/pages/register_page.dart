import 'package:chat_front/widgets/boton_azul.dart';
import 'package:chat_front/widgets/custom_input.dart';
import 'package:chat_front/widgets/labels.dart';
import 'package:chat_front/widgets/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(texto: 'Registro'),
                _Form(),
                Labels(
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  textoAzul: '¡Inicia sesión ahora',
                  textoGris: "¿Ya tienes una cuenta?",
                ),
                const Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwdCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            textController: nombreCtrl),
        CustomInput(
            icon: Icons.mail_lock_outlined,
            placeholder: 'Correo',
            textController: emailCtrl,
            keyboardType: TextInputType.emailAddress),
        CustomInput(
            icon: Icons.lock_clock_outlined,
            placeholder: 'Contraseña',
            textController: passwdCtrl,
            isPassword: true),
        BotonAzul(
            onClick: () {
              print(emailCtrl.text);
              print(passwdCtrl.text);
            },
            texto: 'Registrarme')
      ]),
    );
  }
}
