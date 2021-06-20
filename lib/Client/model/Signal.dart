class SignalModel {
  String userId, artisanId, typeraport, descriptionsignal;

  SignalModel(
      {this.userId, this.typeraport, this.descriptionsignal, this.artisanId});

  SignalModel.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    artisanId = map['artisanId'];
    typeraport = map['typeraport'];
    descriptionsignal = map['descriptionsignal'];
  }

  toJson() {
    return {
      'userId': userId,
      'artisanId': artisanId,
      'typeraport': typeraport,
      'descriptionsignal': descriptionsignal,
    };
  }
}
