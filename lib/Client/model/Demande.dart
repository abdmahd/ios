class Demande {
  String userId, artisanId, typeWork, description, wilaya;

  Demande(
      {this.userId,
      this.typeWork,
      this.description,
      this.wilaya,
      this.artisanId});

  Demande.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    artisanId = map['artisanId'];
    typeWork = map['TypeWork'];
    description = map['Description'];
    wilaya = map['Wilaya'];
  }

  toJson() {
    return {
      'userId': userId,
      'artisanId': artisanId,
      'TypeWork': typeWork,
      'Description': description,
      'Wilaya': wilaya,
    };
  }
}
