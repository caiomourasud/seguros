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
  setFocus(value) => onFocus = value;

  @observable
  String searchText = '';

  @action
  setSearchText(value) => searchText = value;

  @observable
  List<AtividadeModel> atividades = [
    AtividadeModel(value: 1, title: 'Administrador(a)'),
    AtividadeModel(value: 2, title: 'Administrador(a) de ONG'),
    AtividadeModel(value: 3, title: 'Advogado(a)'),
    AtividadeModel(value: 4, title: 'Analista'),
    AtividadeModel(value: 5, title: 'Aposentado(a)'),
    AtividadeModel(value: 6, title: 'Arquiteto(a)'),
    AtividadeModel(value: 7, title: 'Artesão(ã), Artista plástico(a)'),
    AtividadeModel(value: 8, title: 'Assistente'),
    AtividadeModel(value: 9, title: 'Assistente social'),
    AtividadeModel(value: 10, title: 'Atendente'),
    AtividadeModel(value: 11, title: 'Atleta'),
    AtividadeModel(value: 12, title: 'Ator, Atriz'),
    AtividadeModel(value: 13, title: 'Auditor(a)'),
    AtividadeModel(value: 14, title: 'Autônomo(a) vinculado(a) a APP'),
    AtividadeModel(value: 15, title: 'Auxiliar'),
    AtividadeModel(value: 16, title: 'Bancário(a)'),
    AtividadeModel(value: 17, title: 'Biomédico(a)'),
    AtividadeModel(value: 18, title: 'Biólogo(a)'),
    AtividadeModel(value: 19, title: 'Bombeiro(a), Salva-vidas'),
    AtividadeModel(value: 20, title: 'Cabeleireiro(a), Manicure, Esteticista'),
    AtividadeModel(value: 21, title: 'Camareiro(a)'),
    AtividadeModel(value: 22, title: 'Comerciário(a)'),
    AtividadeModel(value: 23, title: 'Consultor(a)'),
    AtividadeModel(value: 24, title: 'Contador(a)'),
    AtividadeModel(value: 25, title: 'Corretor(a)'),
    AtividadeModel(value: 26, title: 'Corretor(a) de imóvel'),
    AtividadeModel(value: 27, title: 'Cozinheiro(a), Chef'),
    AtividadeModel(value: 28, title: 'Dançarino(a)'),
    AtividadeModel(value: 29, title: 'Decorador(a)'),
    AtividadeModel(value: 30, title: 'Dentista'),
    AtividadeModel(value: 31, title: 'Desenvolvedor(a) de software'),
    AtividadeModel(value: 32, title: 'Designer)'),
    AtividadeModel(value: 33, title: 'Despachante aduaneiro)'),
    AtividadeModel(value: 34, title: 'Detetive profissional)'),
    AtividadeModel(value: 35, title: 'Diretor(a), Gestor(a)'),
    AtividadeModel(value: 36, title: 'Economista)'),
    AtividadeModel(value: 37, title: 'Eletricista)'),
    AtividadeModel(value: 38, title: 'Empresário(a)'),
    AtividadeModel(value: 39, title: 'Encanador(a)'),
    AtividadeModel(value: 40, title: 'Enfermeiro(a)'),
    AtividadeModel(value: 41, title: 'Engenheito(a)'),
    AtividadeModel(value: 42, title: 'Escritor(a)'),
    AtividadeModel(value: 43, title: 'Estilista, Costureiro(a)'),
    AtividadeModel(value: 44, title: 'Estudante'),
    AtividadeModel(value: 45, title: 'Farmacêutico(a)'),
    AtividadeModel(value: 46, title: 'Fisioterapeuta'),
    AtividadeModel(value: 47, title: 'Fonoaudiólogo(a)'),
    AtividadeModel(value: 48, title: 'Fotógrafo(a)'),
    AtividadeModel(value: 49, title: 'Funcionário(a) público(a)'),
    AtividadeModel(value: 50, title: 'Físico(a)'),
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
