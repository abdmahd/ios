class ArtisanModel {
  String artisanId,
      fullname,
      username,
      age,
      wilaya,
      email,
      pic,
      phonenumber,
      prof;

  ArtisanModel(
      {this.artisanId,
      this.fullname,
      this.username,
      this.age,
      this.wilaya,
      this.email,
      this.pic,
      this.phonenumber,
      this.prof});

  ArtisanModel.fromJson(
    Map<dynamic, dynamic> json,
  ) {
    if (json == null) {
      return;
    }

    artisanId = json['userId'];
    email = json['email'];
    fullname = json['fullname'];
    username = json['username'];
    age = json['age'];
    wilaya = json['wilaya'];
    pic = json['pic'];
    phonenumber = json['phonenumber'];
    prof = json['proff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['userId'] = this.artisanId;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['age'] = this.age;
    data['wilaya'] = this.wilaya;
    data['pic'] = this.pic;
    data['phonenumber'] = this.phonenumber;
    data['proff'] = this.prof;

    return data;
  }
}
