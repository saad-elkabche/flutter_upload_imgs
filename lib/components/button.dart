import 'package:flutter/material.dart';



class MyButton extends StatelessWidget {
  String label;
  void Function() onclick;
  Color? buttonClor;
  
  MyButton({required this.label,required this.onclick,this.buttonClor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(label),
        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
        textColor: Colors.white,
        color: buttonClor ?? Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        onPressed: onclick,
    );
  }
}
