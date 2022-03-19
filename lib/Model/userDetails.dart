// ignore: camel_case_types
class userDetails {
  String userName;
  String userEmail;
  //String userPhoto;
  int scoreGlobale;
  int score = 0;

  userDetails(String _userName, String _usreEmail) {
    this.userName = _userName;
    this.userEmail = _usreEmail;
  }

  // ignore: non_constant_identifier_names
  userDetails_fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userEmail = json['userEmail'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    return data;
  }

  getScore() {
    return this.score;
  }

  setScore(int x) {
    this.score = x;
  }
}
