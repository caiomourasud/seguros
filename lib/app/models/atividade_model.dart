class AtividadeModel {
  int? id;
  Titles? titles;
  Values? values;
  Taxas? taxas;

  AtividadeModel({this.id, this.titles, this.values, this.taxas});

  AtividadeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titles =
        json['titles'] != null ? new Titles.fromJson(json['titles']) : null;
    values =
        json['values'] != null ? new Values.fromJson(json['values']) : null;
    taxas = json['taxas'] != null ? new Taxas.fromJson(json['taxas']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.titles != null) {
      data['titles'] = this.titles!.toJson();
    }
    if (this.values != null) {
      data['values'] = this.values!.toJson();
    }
    if (this.taxas != null) {
      data['taxas'] = this.taxas!.toJson();
    }
    return data;
  }
}

class Titles {
  String? pt;
  String? en;
  String? es;

  Titles({this.pt, this.en, this.es});

  Titles.fromJson(Map<String, dynamic> json) {
    pt = json['pt'];
    en = json['en'];
    es = json['es'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt'] = this.pt;
    data['en'] = this.en;
    data['es'] = this.es;
    return data;
  }
}

class Values {
  double? value50;
  double? value75;
  double? value100;
  double? value125;
  double? value150;

  Values(
      {this.value50,
      this.value75,
      this.value100,
      this.value125,
      this.value150});

  Values.fromJson(Map<String, dynamic> json) {
    value50 = json['value50'];
    value75 = json['value75'];
    value100 = json['value100'];
    value125 = json['value125'];
    value150 = json['value150'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value50'] = this.value50;
    data['value75'] = this.value75;
    data['value100'] = this.value100;
    data['value125'] = this.value125;
    data['value150'] = this.value150;
    return data;
  }
}

class Taxas {
  SimpleValues? hospitalizacao;
  Values? invalidez;
  SimpleValues? funeralConjugeFilhos;
  SimpleValues? funeralPais;

  Taxas(
      {this.hospitalizacao,
      this.invalidez,
      this.funeralConjugeFilhos,
      this.funeralPais});

  Taxas.fromJson(Map<String, dynamic> json) {
    hospitalizacao = json['hospitalizacao'] != null
        ? new SimpleValues.fromJson(json['hospitalizacao'])
        : null;
    invalidez = json['invalidez'] != null
        ? new Values.fromJson(json['invalidez'])
        : null;
    funeralConjugeFilhos = json['funeral_conjuge_filhos'] != null
        ? new SimpleValues.fromJson(json['funeral_conjuge_filhos'])
        : null;
    funeralPais = json['funeral_pais'] != null
        ? new SimpleValues.fromJson(json['funeral_pais'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hospitalizacao != null) {
      data['hospitalizacao'] = this.hospitalizacao!.toJson();
    }
    if (this.invalidez != null) {
      data['invalidez'] = this.invalidez!.toJson();
    }
    if (this.funeralConjugeFilhos != null) {
      data['funeral_conjuge_filhos'] = this.funeralConjugeFilhos!.toJson();
    }
    if (this.funeralPais != null) {
      data['funeral_pais'] = this.funeralPais!.toJson();
    }
    return data;
  }
}

class SimpleValues {
  double? value50;
  double? value75;
  double? value100;

  SimpleValues({this.value50, this.value75, this.value100});

  SimpleValues.fromJson(Map<String, dynamic> json) {
    value50 = json['value50'];
    value75 = json['value75'];
    value100 = json['value100'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value50'] = this.value50;
    data['value75'] = this.value75;
    data['value100'] = this.value100;
    return data;
  }
}
