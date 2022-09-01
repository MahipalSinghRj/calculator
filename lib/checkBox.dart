import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCheckbox extends StatefulWidget {
  MyCheckbox({Key? key}) : super(key: key);

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

//Added by mahipal

class _MyCheckboxState extends State<MyCheckbox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () {
            setState(() {
              this.value = !this.value;
            });
          },
          child: Center(
            child: Container(
              child: value
                  ? Container(
                      child: SvgPicture.asset('assets/Vector.svg'))

                  : Container(
                      child: SvgPicture.asset('assets/Group.svg')),
            ),
          )),
    );
  }
}
