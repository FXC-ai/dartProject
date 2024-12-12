class Referent {
  int id;
  String fname;
  String lname;
  String login;
  String password;

  Referent(
      this.id,
      this.fname,
      this.lname,
      this.login,
      this.password,
      );

  Referent.fromMap(Map<String, dynamic> map):
        id = map["id"],
        fname = map["fname"],
        lname = map["lname"],
        login = map["login"],
        password = map["password"];

}