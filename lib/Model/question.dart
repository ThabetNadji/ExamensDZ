// ignore: camel_case_types
class question {
  String rep1;
  String rep2;
  String rep3;
  String rep4;
  String questionText;
  int correctRepNum;

  qustion() {}

  setQuestion(Map<String, dynamic> json) {
    this.correctRepNum = json['correctRepNum'];
    this.rep1 = json['rep1'];
    this.rep2 = json['rep2'];
    this.rep3 = json['rep3'];
    this.rep4 = json['rep4'];
    this.questionText = json['questionText'];
  }

  // ignore: non_constant_identifier_names
  set_Question(String rep1, String rep2, String rep3, String rep4,
      String textQuestion, int numRep) {
    this.correctRepNum = numRep;
    this.rep1 = rep1;
    this.rep2 = rep2;
    this.rep3 = rep3;
    this.rep4 = rep4;
    this.questionText = textQuestion;
  }
}
