class ApellModel {
  String userId, typework, location, description;

  ApellModel({
    this.userId,
    this.typework,
    this.location,
    this.description,
  });

  ApellModel.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    typework = map['typework'];
    location = map['location'];
    description = map['description'];
  }

  toJson() {
    return {
      'userId': userId,
      'typework': typework,
      'location': location,
      'description': description,
    };
  }
}
