import 'package:coba_flutter/main_full.dart';
import 'package:flutter/material.dart';
import '../widgets/input_custom.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPageFul extends StatefulWidget {
  @override
  SignupPage createState() => SignupPage();
}

class SignupPage extends State<SignUpPageFul>{
  InputCustom? input_1;
  InputCustom? input_2;
  InputCustom? input_3;
  InputCustom? input_4;
  InputCustom? input_5;
  InputCustom? input_6;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _signup() async {
    try {
      final url = Uri.parse('http://192.168.0.104:8000/api/register'); // Ganti IP sesuai kondisi

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": usernameController.text,
          "no_hp": noHpController.text,
          "alamat": alamatController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "password_confirmation": confirmPasswordController.text, 
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registrasi berhasil: ${data['message']}")),
        );
        print("Registrasi berhasil: ${data['user']}");
      } else {
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registrasi gagal: ${errorData['message'] ?? 'Terjadi kesalahan'}")),
        );
        print("Registrasi gagal: ${errorData}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal menghubungi server")),
      );
      print("Error: $e");
    }
  }


  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFul()), 
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50, right: 40, left: 40, bottom: 50),
            child: Column(
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 255, 31, 136),
                  )
                ),
                SizedBox(height: 20,),
                Text(
                  'Daftarkan akun anda untuk mengakses halaman utama',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  )
                ),
                SizedBox(height: 20,),
                input_1 = InputCustom(
                  label: 'Username', 
                  warna : Color.fromARGB(255, 255, 31, 136), 
                  icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  controller: usernameController,
                ),
                SizedBox(height: 10,),
                input_2 = InputCustom(
                  label: 'No.Hp', 
                  warna : Color.fromARGB(255, 255, 31, 136), 
                  icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  controller: noHpController,
                ),
                SizedBox(height: 10,),
                input_3 = InputCustom(
                  label: 'Alamat', 
                  warna : Color.fromARGB(255, 255, 31, 136), 
                  icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  controller: alamatController,
                ),
                SizedBox(height: 10,),
                input_4 = InputCustom(
                  label: 'Email', 
                  warna : Color.fromARGB(255, 255, 31, 136), 
                  icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: 10,),
                input_5 = InputCustom(
                  label: 'Password', 
                  warna : Color.fromARGB(255, 255, 31, 136), 
                  icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  controller: passwordController,
                  hide: true,
                ),
                SizedBox(height: 10,),
                input_6 = InputCustom(
                  label: 'Confirm Password', 
                  warna : Color.fromARGB(255, 255, 31, 136), 
                  icon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  controller: confirmPasswordController,
                  hide: true,
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _signup, // Login Function
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 31, 136),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                ),
                SizedBox(height: 10,),
                RichText(
                  textAlign: TextAlign.justify,
                  text:
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'sudah daftar ? silahkan  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.black,
                        )
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xFF1893FF),
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color.fromARGB(255, 190, 210, 221),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFF1893FF), width: 1), // Border atas tipis
                        left: BorderSide(color: Color(0xFF1893FF), width: 1), // Border kiri tipis
                        right: BorderSide(color: Color(0xFF1893FF), width: 1), // Border kanan tipis
                        bottom: BorderSide(color: Color(0xFF1893FF), width: 5), // Border bawah lebih tebal
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ElevatedButton(
                      onPressed: _goToLogin, // Pindah ke Sign Up
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1893FF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}