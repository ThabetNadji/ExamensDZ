import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myEduApp/Model/Trimester.dart';
import 'package:myEduApp/Model/question.dart';
import 'package:myEduApp/Model/users.dart';
import 'package:myEduApp/Services/courseNameConvertisor.dart';

// ignore: camel_case_types
class quizServices {
  // some code here
  // some other change ...
  String publicUrl =
      'https://heroku-quizapi.herokuapp.com/'; // heroku deployed address
  //String publicUrl = 'http://172.20.10.3:8080/'; // localhost address
  String dash = '/';
  courseNameConvertisor convert = new courseNameConvertisor();

  Future getExames(String course, String trim) async {
    print('getExames services ...');
    String _getExamensUrl = 'getExamens/';
    courseNameConvertisor convert = new courseNameConvertisor();
    String courseNameConv = convert.convCourseName(course);
    String trimConv = convert.convTrim(trim);

    String getExameslUrl =
        '$publicUrl$_getExamensUrl$courseNameConv$dash$trimConv';
    int i = 0;
    final uri = Uri.parse(getExameslUrl);
    var resp = await http.get(uri);
    var jsonData = jsonDecode(resp.body);

    print('address valid ...');
    List<Trimester> listTrim = [];
    for (var t in jsonData) {
      i = i + 1;
      Trimester tr = new Trimester();
      tr.setTrim(t);
      listTrim.add(tr);
    }

    return i;
  }

  Future getQuestion(String examNum, String questionNum, String _courseName,
      String _trim) async {
    print('getQuestion services ...');
    String _getQuestionUrl = 'getQuestion/';
    question _question = new question(); // create a new instance of question
    String courseNameConv = convert.convCourseName(_courseName);
    String trimConv = convert.convTrim(_trim);
    String getQuestionUrl =
        '$publicUrl$_getQuestionUrl$courseNameConv$dash$trimConv$dash$examNum$dash$questionNum';
    final Uri urlGetQuestionUrl = Uri.parse(getQuestionUrl);
    var resp = await http.get(urlGetQuestionUrl); //  1
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      _question.setQuestion(jsonDecode(body));
      return _question;
    } else {
      return false;
    }
  }

  Future getListQuestion(
      String examNum, String _courseName, String _trim) async {
    print('getListQuestion services ...');
    String _getListQuestion = 'getListQuestion/';
    question _question = question();
    List<question> _listQuestion = new List<question>();
    List listQuestion = new List();
    String courseNameConv = convert.convCourseName(_courseName);
    String trimConv = convert.convTrim(_trim);

    String getListQuestionUrl =
        '$publicUrl$_getListQuestion$courseNameConv$dash$trimConv$dash$examNum';
    final Uri urlGetQuestionUrl = Uri.parse(getListQuestionUrl);
    var resp = await http.get(urlGetQuestionUrl);

    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      listQuestion = jsonDecode(body); // key
    }
    return List<Map<String, dynamic>>.from(
        jsonDecode(utf8.decode(resp.bodyBytes)));
  }

  Future userIsExist(String userID) async {
    print('userIsExist process');
    String uerIsExist = 'userIsExist/';
    // String isExist = 'false';
    String getUserIsExist = '$publicUrl$uerIsExist$userID';
    final Uri urlGetQuestionUrl = Uri.parse(getUserIsExist);
    var resp = await http.get(urlGetQuestionUrl);
    String body = utf8.decode(resp.bodyBytes);
    //var jsonData = jsonDecode(body);
    users us = new users();
    us.setUser(jsonDecode(body));
    return us;
  }

  addNewUser(String userID, String userName) {
    print('add new user process');
    String saveUser = 'addUser/';
    String addUser = '$publicUrl$saveUser$userID$dash$userName';
    final Uri urlGetQuestionUrl = Uri.parse(addUser);
    http.post(urlGetQuestionUrl);
    print('user added successfully');
  }

  updateScore(String userID, int score) {
    print('update score global');
    String _updateScore = 'upDateScore/';
    String upDateScoreUrl = '$publicUrl$_updateScore$userID$dash$score';
    final Uri urlUpDateScoreUrl = Uri.parse(upDateScoreUrl);
    http.post(urlUpDateScoreUrl);
    print('score update successfully');
  }

  saveExam(String userID, String examSchema, int score) {
    print('saveExam ...');
    String saveExam = 'saveExam/';
    String saveExamUr = '$publicUrl$saveExam$userID$dash$examSchema$dash$score';
    print('odlUrl' + saveExamUr);
    final Uri urlSaveExamUr = Uri.parse(saveExamUr);
    http.post(urlSaveExamUr);
    String newUrl = saveExamUr.replaceAll('.', '/');
    print('newUrl' + newUrl);
    print('exam saved successfully');
  }

  Future getSeason() async {
    print('getSeason ...');
    String getSeason = 'getSeason/';
    String getSeasonUrl = '$publicUrl$getSeason';
    final Uri urlGetSeasonUrl = Uri.parse(getSeasonUrl);
    var resp = await http.get(urlGetSeasonUrl);
    var jsonData = jsonDecode(resp.body);
    return jsonData;
  }

  Future examIsPassed(String userID, String schema) async {
    print('examIsExist ...');
    String examIsExist = 'examIsExist/';
    String _examIsExist = '$publicUrl$examIsExist$userID$dash$schema';
    print('exam Is Exist ? ' + _examIsExist);
    final Uri urlExamIsExist = Uri.parse(_examIsExist);
    var resp = await http.get(urlExamIsExist);
    var jsonData = jsonDecode(resp.body);
    return jsonData;
  }

  //  ---------- statistic functions ---------------
  //global number of exam in a trim -> x for specific user
  Future getExamNumberOfTrim(String userID, String trim) async {
    print('getExamNumberOfTrim ...');
    String getExamNumberOfTrim = 'getExamNumberOfTrim/';
    String _getExamNumberOfTrim =
        '$publicUrl$getExamNumberOfTrim$userID$dash$trim';
    final uri = Uri.parse(_getExamNumberOfTrim);
    var resp = await http.get(uri);
    var jsonData = jsonDecode(resp.body);
    return jsonData;
  }

//global number of exam in a trim -> y
  Future getNumberOfExamsInTrim(String trim) async {
    print('getNumberOfExamsInTrim ...');
    String getNumberOfExamsInTrim = 'getNumberOfExamsInTrim/';
    String _getNumberOfExamsInTrim = '$publicUrl$getNumberOfExamsInTrim$trim';
    final uri = Uri.parse(_getNumberOfExamsInTrim);
    var resp = await http.get(uri);
    var jsonData = jsonDecode(resp.body);
    return jsonData;
  }

  //get score of a trim in specific user -> xy for specific user
  Future getScoreOfTrim(String userID, String trim) async {
    print('getScoreOfTrim ...');
    String getScoreOfTrim = 'getScoreOfTrim/';
    String _getScoreOfTrim = '$publicUrl$getScoreOfTrim$userID$dash$trim';
    print('getScoreOfTrim Url ' + _getScoreOfTrim);
    final uri = Uri.parse(_getScoreOfTrim);
    var resp = await http.get(uri);
    var jsonData = jsonDecode(resp.body);
    return jsonData;
  }
}
