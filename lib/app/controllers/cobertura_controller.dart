import 'package:mobx/mobx.dart';
import 'package:seguros/app/models/atividade_model.dart';
part 'cobertura_controller.g.dart';

class CoberturaController = _CoberturaControllerBase with _$CoberturaController;

abstract class _CoberturaControllerBase with Store {
  @observable
  double cobertura = 75000;

  @action
  setCobertura(double value) => cobertura = value;

  @observable
  double valorTotal = 0.0;

  @action
  setValorTotal(double value) => valorTotal = value;

  @observable
  bool hospitalizacao = false;

  @action
  setHospitalizacao(bool value) => hospitalizacao = value;

  @observable
  bool invalidez = false;

  @action
  setInvalidez(bool value) => invalidez = value;

  @observable
  bool funeralConjugeFilhos = false;

  @action
  setFuneralConjugeFilhos(bool value) => funeralConjugeFilhos = value;

  @observable
  bool funeralPais = false;

  @action
  setFuneralPais(bool value) => funeralPais = value;

  @action
  onSelect({required bool item, Values? values, SimpleValues? simpleValues}) {
    if (item) {
      setValorTotal(valorTotal +
          (values == null
              ? setSimpleValue(
                  cobertura: cobertura.toString(), values: simpleValues!)
              : setValue(cobertura: cobertura.toString(), values: values)));
    } else {
      setValorTotal(valorTotal -
          (values == null
              ? setSimpleValue(
                  cobertura: cobertura.toString(), values: simpleValues!)
              : setValue(cobertura: cobertura.toString(), values: values)));
    }
  }

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
