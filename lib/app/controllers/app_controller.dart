import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:seguros/app/models/atividade_model.dart';
import 'package:seguros/app/utils/converters.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  BuildContext? context;

  @action
  setContext(value) => context = value;

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
  List<AtividadeModel> atividades = [
    AtividadeModel(value: 1, title: 'Administrador(a)', valor: 7.50),
    AtividadeModel(value: 2, title: 'Administrador(a) de ONG', valor: 7.50),
    AtividadeModel(value: 3, title: 'Advogado(a)', valor: 7.50),
    AtividadeModel(value: 4, title: 'Analista', valor: 7.50),
    AtividadeModel(value: 5, title: 'Aposentado(a)', valor: 7.50),
    AtividadeModel(value: 6, title: 'Arquiteto(a)', valor: 7.50),
    AtividadeModel(
        value: 7, title: 'Artesão(ã), Artista plástico(a)', valor: 7.50),
    AtividadeModel(value: 8, title: 'Assistente', valor: 7.50),
    AtividadeModel(value: 9, title: 'Assistente social', valor: 7.50),
    AtividadeModel(value: 10, title: 'Atendente', valor: 7.50),
    AtividadeModel(value: 11, title: 'Atleta', valor: 7.50),
    AtividadeModel(value: 12, title: 'Ator, Atriz', valor: 7.50),
    AtividadeModel(value: 13, title: 'Auditor(a)', valor: 7.50),
    AtividadeModel(
        value: 14, title: 'Autônomo(a) vinculado(a) a APP', valor: 7.50),
    AtividadeModel(value: 15, title: 'Auxiliar', valor: 7.50),
    AtividadeModel(value: 16, title: 'Bancário(a)', valor: 7.50),
    AtividadeModel(value: 17, title: 'Biomédico(a)', valor: 7.50),
    AtividadeModel(value: 18, title: 'Biólogo(a)', valor: 7.50),
    AtividadeModel(value: 19, title: 'Bombeiro(a), Salva-vidas', valor: 7.50),
    AtividadeModel(
        value: 20,
        title: 'Cabeleireiro(a), Manicure, Esteticista',
        valor: 7.50),
    AtividadeModel(value: 21, title: 'Camareiro(a)', valor: 7.50),
    AtividadeModel(value: 22, title: 'Comerciário(a)', valor: 7.50),
    AtividadeModel(value: 23, title: 'Consultor(a)', valor: 7.50),
    AtividadeModel(value: 24, title: 'Contador(a)', valor: 7.50),
    AtividadeModel(value: 25, title: 'Corretor(a)', valor: 7.50),
    AtividadeModel(value: 26, title: 'Corretor(a) de imóvel', valor: 7.50),
    AtividadeModel(value: 27, title: 'Cozinheiro(a), Chef', valor: 7.50),
    AtividadeModel(value: 28, title: 'Dançarino(a)', valor: 7.50),
    AtividadeModel(value: 29, title: 'Decorador(a)', valor: 7.50),
    AtividadeModel(value: 30, title: 'Dentista', valor: 7.50),
    AtividadeModel(
        value: 31, title: 'Desenvolvedor(a) de software', valor: 4.80),
    AtividadeModel(value: 32, title: 'Designer', valor: 7.50),
    AtividadeModel(value: 33, title: 'Despachante aduaneiro', valor: 7.50),
    AtividadeModel(value: 34, title: 'Detetive profissional', valor: 7.50),
    AtividadeModel(value: 35, title: 'Diretor(a), Gestor(a)', valor: 7.50),
    AtividadeModel(value: 36, title: 'Economista)', valor: 7.50),
    AtividadeModel(value: 37, title: 'Eletricista', valor: 7.50),
    AtividadeModel(value: 38, title: 'Empresário(a)', valor: 7.50),
    AtividadeModel(value: 39, title: 'Encanador(a)', valor: 7.50),
    AtividadeModel(value: 40, title: 'Enfermeiro(a)', valor: 7.50),
    AtividadeModel(value: 41, title: 'Engenheito(a)', valor: 7.50),
    AtividadeModel(value: 42, title: 'Escritor(a)', valor: 7.50),
    AtividadeModel(value: 43, title: 'Estilista, Costureiro(a)', valor: 7.50),
    AtividadeModel(value: 44, title: 'Estudante', valor: 7.50),
    AtividadeModel(value: 45, title: 'Farmacêutico(a)', valor: 7.50),
    AtividadeModel(value: 46, title: 'Fisioterapeuta', valor: 7.50),
    AtividadeModel(value: 47, title: 'Fonoaudiólogo(a)', valor: 7.50),
    AtividadeModel(value: 48, title: 'Fotógrafo(a)', valor: 7.50),
    AtividadeModel(value: 49, title: 'Funcionário(a) público(a)', valor: 7.50),
    AtividadeModel(value: 50, title: 'Físico(a)', valor: 7.50),
  ];

  @computed
  List<AtividadeModel> get filterAtividades {
    if (searchText == '') {
      return atividades;
    } else {
      return atividades
          .where((atividade) => Converters()
              .simplifyString(atividade.title)
              .contains(Converters().simplifyString(searchText)))
          .toList();
    }
  }
}
