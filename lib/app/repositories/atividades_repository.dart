import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:seguros/app/models/atividade_model.dart';

class AtividadesRepositiry {
  Future<List<AtividadeModel>> fecthAtividades() async {
    List<AtividadeModel> _atividades = [];

    const _jsonDir = 'assets/json/';
    const _jsonExtension = '.json';
    final resourcePath = _jsonDir + 'atividades' + _jsonExtension;
    final data = await rootBundle.load(resourcePath);

    List list = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );
    _atividades =
        list.map((sessao) => AtividadeModel.fromJson(sessao)).toList();

    return _atividades;
  }
}
