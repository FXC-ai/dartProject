class AnswerQuestion {
  int id;
  String date;
  int referent_id;
  int participant_id;
  int charge_m;


  AnswerQuestion(this.id,
                this.date,
                this.referent_id,
                this.participant_id,
                this.charge_m,
      );

  AnswerQuestion.fromMap(Map<String, dynamic> map):
        id = map["id"],
        date = map["date"],
        referent_id = map["referent_id"],
        participant_id = map["participant_id"],
        charge_m = map["charge_m"];

}



