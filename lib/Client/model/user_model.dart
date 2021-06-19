class UserModel {
  String userId, fullname, username, age, wilaya, email, pic, phonenumber;

  UserModel(
      {this.userId,
      this.fullname,
      this.username,
      this.age,
      this.wilaya,
      this.email,
      this.pic,
      this.phonenumber});

  UserModel.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    fullname = map['fullname'];
    username = map['username'];
    age = map['age'];
    wilaya = map['wilaya'];
    pic = map['pic'];
    phonenumber = map['phonenumber'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'fullname': fullname,
      'username': username,
      'age': age,
      'wilaya': wilaya,
      'pic': pic,
      'phonenumber': phonenumber,
    };
  }
}
