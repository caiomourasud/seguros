// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simular_seguro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SimularSeguroController on _SimularSeguroControllerBase, Store {
  Computed<List<AtividadeModel>>? _$filterAtividadesComputed;

  @override
  List<AtividadeModel> get filterAtividades => (_$filterAtividadesComputed ??=
          Computed<List<AtividadeModel>>(() => super.filterAtividades,
              name: '_SimularSeguroControllerBase.filterAtividades'))
      .value;

  final _$focusAtom = Atom(name: '_SimularSeguroControllerBase.focus');

  @override
  FocusNode get focus {
    _$focusAtom.reportRead();
    return super.focus;
  }

  @override
  set focus(FocusNode value) {
    _$focusAtom.reportWrite(value, super.focus, () {
      super.focus = value;
    });
  }

  final _$onFocusAtom = Atom(name: '_SimularSeguroControllerBase.onFocus');

  @override
  bool get onFocus {
    _$onFocusAtom.reportRead();
    return super.onFocus;
  }

  @override
  set onFocus(bool value) {
    _$onFocusAtom.reportWrite(value, super.onFocus, () {
      super.onFocus = value;
    });
  }

  final _$searchTextAtom =
      Atom(name: '_SimularSeguroControllerBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$atividadesAtom =
      Atom(name: '_SimularSeguroControllerBase.atividades');

  @override
  List<AtividadeModel> get atividades {
    _$atividadesAtom.reportRead();
    return super.atividades;
  }

  @override
  set atividades(List<AtividadeModel> value) {
    _$atividadesAtom.reportWrite(value, super.atividades, () {
      super.atividades = value;
    });
  }

  final _$getAtividadesAsyncAction =
      AsyncAction('_SimularSeguroControllerBase.getAtividades');

  @override
  Future getAtividades() {
    return _$getAtividadesAsyncAction.run(() => super.getAtividades());
  }

  final _$_SimularSeguroControllerBaseActionController =
      ActionController(name: '_SimularSeguroControllerBase');

  @override
  dynamic setFocus(bool value) {
    final _$actionInfo = _$_SimularSeguroControllerBaseActionController
        .startAction(name: '_SimularSeguroControllerBase.setFocus');
    try {
      return super.setFocus(value);
    } finally {
      _$_SimularSeguroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchText(dynamic value) {
    final _$actionInfo = _$_SimularSeguroControllerBaseActionController
        .startAction(name: '_SimularSeguroControllerBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_SimularSeguroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle({required BuildContext context, required Titles titles}) {
    final _$actionInfo = _$_SimularSeguroControllerBaseActionController
        .startAction(name: '_SimularSeguroControllerBase.setTitle');
    try {
      return super.setTitle(context: context, titles: titles);
    } finally {
      _$_SimularSeguroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
focus: ${focus},
onFocus: ${onFocus},
searchText: ${searchText},
atividades: ${atividades},
filterAtividades: ${filterAtividades}
    ''';
  }
}
