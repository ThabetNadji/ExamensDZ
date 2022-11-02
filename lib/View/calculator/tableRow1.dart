import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../Controller/GetConroller.dart';

class tableRowOne extends StatefulWidget {
  String moduleName;
  IconData _icons;
  tableRowOne(this.moduleName, this._icons);

  @override
  State<tableRowOne> createState() => _tableRowOneState();
}

class _tableRowOneState extends State<tableRowOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //width: MediaQuery.of(context).size.width / 3,
        //height: MediaQuery.of(context).size.height / 18,
        child: Row(
      children: [
        Icon(widget._icons),
        Text(
          widget.moduleName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Kufi',
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}

class tableRowTwo extends StatefulWidget {
  String moduleName;
  bool readOnly;
  tableRowTwo(this.readOnly, this.moduleName);
  @override
  State<tableRowTwo> createState() => _tableRowTwoState();
}

class _tableRowTwoState extends State<tableRowTwo> {
  final myController = TextEditingController();
  //final GetController _getController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 18,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
          child: GetBuilder<GetController>(
            init: GetController(),
            builder: (gc) => TextFormField(
              controller: myController,
              enabled: widget.moduleName == '  تربية بدنية  '
                  ? gc.isCheckedSport
                  : widget.moduleName == '  تربية فنية   '
                      ? gc.isCheckedArt
                      : widget.moduleName == '  لغة أمازيغية  '
                          ? gc.isCheckedAmazighe
                          : !widget.readOnly,
              textAlign: TextAlign.center,
              cursorColor: Colors.green,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: widget.moduleName == '  تربية بدنية  ' &&
                        gc.isCheckedSport == false
                    ? 'غير محتسب'
                    : widget.moduleName == '  تربية فنية   ' &&
                            gc.isCheckedArt == false
                        ? 'غير محتسب'
                        : widget.moduleName == '  لغة أمازيغية  ' &&
                                gc.isCheckedAmazighe == false
                            ? 'غير محتسب'
                            : '... /20',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                border: UnderlineInputBorder(),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}

class tableRowThree extends StatelessWidget {
  String moduleCoe;
  tableRowThree(this.moduleCoe);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 18,
        child: moduleCoe != '/'
            ? Text(' X ' + moduleCoe,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Kufi',
                    fontSize: 15,
                    fontWeight: FontWeight.bold))
            : Text('/',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Kufi',
                    fontSize: 15,
                    fontWeight: FontWeight.bold)));
  }
}
