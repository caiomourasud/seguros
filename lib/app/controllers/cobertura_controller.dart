import 'package:mobx/mobx.dart';
import 'package:seguros/app/models/atividade_model.dart';
part 'cobertura_controller.g.dart';

class CoberturaController = _CoberturaControllerBase with _$CoberturaController;

abstract class _CoberturaControllerBase with Store {
  @action
  setValue({required String cobertura, required Values values}) {
    switch (cobertura) {
      case '50000.0':
        return values.value50;
      case '75000.0':
        return values.value75;
      case '100000.0':
        return values.value100;
      case '125000.0':
        return values.value125;
      case '150000.0':
        return values.value150;
      default:
        return values.value50;
    }
  }

  @action
  setSimpleValue({required String cobertura, required SimpleValues values}) {
    switch (cobertura) {
      case '50000.0':
        return values.value50;
      case '75000.0':
        return values.value75;
      case '100000.0':
        return values.value100;
      case '125000.0':
        return values.value100;
      case '150000.0':
        return values.value100;
      default:
        return values.value50;
    }
  }
}
