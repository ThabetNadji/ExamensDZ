// ignore: camel_case_types
class users {
  String userID;
  String userName;
  String photoUrl;
  int score;

  /*users(String id, String name, int x) {
    this.userID = id;
    this.userName = name;
    this.score = x;
  }*/
  users() {}

  String setPhotoUrl(x) {
    return photoUrl = x;
  }

  getPhotoUrl() {
    return photoUrl;
  }

  String getUserID() {
    return userID;
  }

  void setUserID(String userID) {
    this.userID = userID;
  }

  String getUserName() {
    return userName;
  }

  void setUserName(String userName) {
    this.userName = userName;
  }

  int getScore() {
    return score;
  }

  void setScore(int score) {
    this.score = score;
  }

  setUser(Map<String, dynamic> json) {
    this.userID = json['userID'];
    this.userName = json['userName'];
    this.score = json['score'];
  }
}
