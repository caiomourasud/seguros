// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividades_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AtividadesController on _AtividadesControllerBase, Store {
  Computed<List<AtividadeModel>>? _$filterAtividadesComputed;

  @override
  List<AtividadeModel> get filterAtividades => (_$filterAtividadesComputed ??=
          Computed<List<AtividadeModel>>(() => super.filterAtividades,
              name: '_AtividadesControllerBase.filterAtividades'))
      .value;

  late final _$focusAtom =
      Atom(name: '_AtividadesControllerBase.focus', context: context);

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

  late final _$onFocusAtom =
      Atom(name: '_AtividadesControllerBase.onFocus', context: context);

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

  late final _$searchTextAtom =
      Atom(name: '_AtividadesControllerBase.searchText', context: context);

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

  late final _$atividadesAtom =
      Atom(name: '_AtividadesControllerBase.atividades', context: context);

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

  late final _$getAtividadesAsyncAction =
      AsyncAction('_AtividadesControllerBase.getAtividades', context: context);

  @override
  Future getAtividades() {
    return _$getAtividadesAsyncAction.run(() => super.getAtividades());
  }

  late final _$_AtividadesControllerBaseActionController =
      ActionController(name: '_AtividadesControllerBase', context: context);

  @override
  dynamic setFocus(bool value) {
    final _$actionInfo = _$_AtividadesControllerBaseActionController
        .startAction(name: '_AtividadesControllerBase.setFocus');
    try {
      return super.setFocus(value);
    } finally {
      _$_AtividadesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchText(dynamic value) {
    final _$actionInfo = _$_AtividadesControllerBaseActionController
        .startAction(name: '_AtividadesControllerBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_AtividadesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle({required BuildContext context, required Titles titles}) {
    final _$actionInfo = _$_AtividadesControllerBaseActionController
        .startAction(name: '_AtividadesControllerBase.setTitle');
    try {
      return super.setTitle(context: context, titles: titles);
    } finally {
      _$_AtividadesControllerBaseActionController.endAction(_$actionInfo);
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
