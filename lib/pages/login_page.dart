import 'package:chat_front/widgets/boton_azul.dart';
import 'package:chat_front/widgets/custom_input.dart';
import 'package:chat_front/widgets/labels.dart';
import 'package:chat_front/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
                const Logo(texto: 'Login'),
                _Form(),
                Labels(
                  onTap: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  textoAzul: '¡Crea una cuenta ahora',
                  textoGris: "¿No tienes cuenta?",
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
  final emailCtrl = TextEditingController();
  final passwdCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
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
            texto: 'Iniciar Sesión')
      ]),
    );
  }
}
