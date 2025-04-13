import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_page.dart';

class LoginPageFul extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPageFul> {
  bool isChecked = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk menyimpan token ke SharedPreferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Fungsi untuk login
  Future<void> _login() async {
    final url = Uri.parse('http://192.168.0.104:8000/api/login'); // Gunakan HTTP untuk server lokal

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": _usernameController.text,
        "password": _passwordController.text,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 && data.containsKey('user')) {
      // Simpan token ke SharedPreferences
      await _saveToken(data['token']);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login berhasil: ${data['message']}")),
      );

      print("User ID: ${data['user']['id']}");
      print("Username: ${data['user']['username']}");
      print("Email: ${data['user']['email']}");
      print("Token: ${data['token']}");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal: ${data['error'] ?? 'Terjadi kesalahan'}")),
      );
      print("Login gagal: ${data['error']}");
    }
  }

  // Navigasi ke halaman signup
  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPageFul()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
            child: Column(
              children: [
                Text(
                  'Log In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF1893FF)),
                ),
                SizedBox(height: 30),
                Text(
                  'Masukkan Username dan Password yang sudah anda daftarkan',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, fontFamily: 'Poppins'),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Username :', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: false,
                    suffixIcon: Icon(Icons.person, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password :', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: false,
                    suffixIcon: Icon(Icons.key, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CheckboxListTile(
                    title: Text("Remember me", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                    value: isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isChecked = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Color(0xFF1893FF),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1893FF),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Text("Log In", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Jika anda belum memiliki akun, silahkan daftar terlebih dahulu. ',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.pink),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(height: 1, width: double.infinity, color: Colors.grey),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ElevatedButton(
                      onPressed: _goToSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text("Sign Up", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.pink)),
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
