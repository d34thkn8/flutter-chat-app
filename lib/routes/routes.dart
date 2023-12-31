import 'package:chat_front/pages/chat_page.dart';
import 'package:chat_front/pages/loading_page.dart';
import 'package:chat_front/pages/login_page.dart';
import 'package:chat_front/pages/register_page.dart';
import 'package:chat_front/pages/usuarios_pages.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage(),
};
