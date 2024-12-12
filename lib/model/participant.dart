class Participant {
  int id;
  String fname;
  String lname;
  int referent_id;

  Participant(this.id,
      this.lname,
      this.fname,
      this.referent_id);

  Participant.fromMap(Map<String, dynamic> map):
        id = map["id"],
        fname = map["fname"],
        lname = map["lname"],
        referent_id = map["referent_id"];

}