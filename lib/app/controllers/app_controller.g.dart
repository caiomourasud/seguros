// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<List<AtividadeModel>>? _$filterAtividadesComputed;

  @override
  List<AtividadeModel> get filterAtividades => (_$filterAtividadesComputed ??=
          Computed<List<AtividadeModel>>(() => super.filterAtividades,
              name: '_AppControllerBase.filterAtividades'))
      .value;

  final _$contextAtom = Atom(name: '_AppControllerBase.context');

  @override
  BuildContext? get context {
    _$contextAtom.reportRead();
    return super.context;
  }

  @override
  set context(BuildContext? value) {
    _$contextAtom.reportWrite(value, super.context, () {
      super.context = value;
    });
  }

  final _$focusAtom = Atom(name: '_AppControllerBase.focus');

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

  final _$onFocusAtom = Atom(name: '_AppControllerBase.onFocus');

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

  final _$searchTextAtom = Atom(name: '_AppControllerBase.searchText');

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

  final _$atividadesAtom = Atom(name: '_AppControllerBase.atividades');

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

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic setContext(dynamic value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setContext');
    try {
      return super.setContext(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFocus(dynamic value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setFocus');
    try {
      return super.setFocus(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchText(dynamic value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
context: ${context},
focus: ${focus},
onFocus: ${onFocus},
searchText: ${searchText},
atividades: ${atividades},
filterAtividades: ${filterAtividades}
    ''';
  }
}
