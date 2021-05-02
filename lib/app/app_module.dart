import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/app_controller.dart';
import 'controllers/cobertura_controller.dart';
import 'controllers/simular_seguro_controller.dart';
import 'pages/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AppController()),
    Bind((i) => SimularSeguroController()),
    Bind((i) => CoberturaController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}
