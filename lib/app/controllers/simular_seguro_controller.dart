import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:seguros/app/models/atividade_model.dart';
import 'package:seguros/app/repositories/atividades_repository.dart';
import 'package:seguros/app/utils/converters.dart';

import 'app_controller.dart';
part 'simular_seguro_controller.g.dart';

final _appController = Modular.get<AppController>();
final _atividadesRepository = AtividadesRepositiry();

class SimularSeguroController = _SimularSeguroControllerBase
    with _$SimularSeguroController;

abstract class _SimularSeguroControllerBase with Store {
  @observable
  FocusNode focus = FocusNode();

  @observable
  bool onFocus = false;

  @action
  setFocus(bool value) => onFocus = value;

  @observable
  String searchText = '';

  @action
  setSearchText(value) => searchText = value;

  @observable
  List<AtividadeModel> atividades = [];

  @action
  setTitle({required BuildContext context, required Titles titles}) {
    switch (Localizations.localeOf(context).toString()) {
      case 'pt':
        return titles.pt;
      case 'en':
        return titles.en;
      case 'es':
        return titles.es;
      default:
        return titles.pt;
    }
  }

  @action
  getAtividades() async {
    atividades = [];
    atividades = await _atividadesRepository.fecthAtividades();
  }

  @computed
  List<AtividadeModel> get filterAtividades {
    if (searchText == '') {
      return atividades;
    } else {
      return atividades
          .where((atividade) => Converters()
              .simplifyString(setTitle(
                  context: _appController.context!, titles: atividade.titles!))
              .contains(Converters().simplifyString(searchText)))
          .toList();
    }
  }
}
