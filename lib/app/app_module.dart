import 'package:flutter_modular/flutter_modular.dart';
import 'package:seguros/controllers/app_controller.dart';
import 'package:seguros/pages/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}
