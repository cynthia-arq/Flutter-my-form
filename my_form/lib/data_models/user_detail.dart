
class UserDetail {
  final String name;
  final String email;
  final String mobile;
  final String company;

  UserDetail(this.name,
      this.email,
      this.mobile,
      this.company);

  UserDetail.fromJSON(Map<String, dynamic> json)
      : name = json["name"],
        email  = json["email"],
        mobile  = json["mobile"],
        company  = json["company"];

}