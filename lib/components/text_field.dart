
import 'package:flutter/material.dart';




class MyTextField extends StatelessWidget {
  String label;
  IconData icon;
  TextEditingController controller;
  String? Function(String?)? validator;



  MyTextField({required this.label,required this.icon,required this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
          suffixIcon: Icon(icon,color: Colors.lightBlueAccent,),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(fontSize: 20,color:Colors.lightBlueAccent ),
          border:  const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          enabledBorder:  const OutlineInputBorder(
              borderRadius:  BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color:Colors.lightBlueAccent,width: 1.8)
          ),
          focusedBorder: const OutlineInputBorder(
              borderRadius:  BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(color:Colors.lightBlueAccent,width: 1.8)
          ),
          hintStyle:TextStyle(color:Colors.lightBlueAccent.withOpacity(0.7),fontWeight: FontWeight.bold) ,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
          suffixIconColor: Colors.lightBlueAccent
      ),

    );
  }
}
