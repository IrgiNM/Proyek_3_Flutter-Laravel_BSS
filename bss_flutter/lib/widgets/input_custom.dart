import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final String? label;
  final Color? warna;
  final Widget? icon;
  final TextEditingController? controller;
  final TextInputType? type;
  bool hide = false;

  InputCustom({
    String? label,
    Color? warna,
    Widget? icon,
    TextEditingController? controller,
    TextInputType? type,
    bool? hide
  }) : 
  this.label = label,
  this.warna = warna,
  this.icon = icon,
  this.controller = controller,
  this.type = type,
  this.hide = hide ?? false;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$label :',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              color: Colors.black,
            )
          ),
        ),
        SizedBox(height: 5,),
        TextField(
          obscureText: hide,
          keyboardType: type,
          controller: controller, // Menangkap input
          decoration: InputDecoration(
            labelText: '',
            filled: false,
            fillColor: Colors.grey[200],
            suffixIcon: icon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color.fromARGB(255, 190, 210, 221), width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: this.warna ?? Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          ),
        ),
      ],
    );
  }
}


