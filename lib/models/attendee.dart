class User {
  List<String> utils;
  String sId;
  String fullname;
  String email;
  String category;

  User({this.utils, this.sId, this.fullname, this.email, this.category});

  User.fromJson(Map<String, dynamic> json) {
    utils = json['utils'].cast<String>();
    sId = json['_id'];
    fullname = json['fullname'];
    email = json['email'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['utils'] = this.utils;
    data['_id'] = this.sId;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['category'] = this.category;
    return data;
  }
}