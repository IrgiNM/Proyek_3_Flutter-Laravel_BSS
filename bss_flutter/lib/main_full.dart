import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Hanya mode portrait
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: Pembuka(),
    );
  }
}

class Pembuka extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: 500,
              height: 2700,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, const Color.fromARGB(255, 215, 237, 255)], // Warna gradient
                  begin: Alignment.topLeft,  // Mulai dari kiri atas
                  end: Alignment.bottomRight, // Berakhir di kanan bawah
                ),
              ),
            )
          ),
          // GAMBAR BELAKANG
          Positioned(
            top: 230,
            left: 10,
            child: Opacity(
              opacity: .35,
              child: Image.asset(
                'assets/images/bg_awal.png',
                width: 420,
                height: 420,
              ),
            ),
          ),
  
          // TEKS ATAS
          Positioned(
            top: 80,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BUMMI Sablon Studio',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF012385),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text:
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Lihat Hasil Cetakan Terbaikmu ',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                            fontSize: 35,
                            color: Color(0xFF012385),
                            height: 1.2,
                          )
                        ),
                        TextSpan(
                          text: '!',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                            fontSize: 35,
                            color: Color.fromARGB(255, 255, 31, 136),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // TEKS LINK START
          Positioned(
            left: 50,
            bottom: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                child: Container(
                  width: 260,
                  height: 50,
                  alignment: Alignment.center, // Agar tombol berada di tengah
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna background (dipindahkan dari "color" di Container)
                    border: Border(
                      top: BorderSide(color: Color(0xFF012385), width: 1), // Border atas tipis
                      left: BorderSide(color: Color(0xFF012385), width: 1), // Border kiri tipis
                      right: BorderSide(color: Color(0xFF012385), width: 1), // Border kanan tipis
                      bottom: BorderSide(color: Color(0xFF012385), width: 5), // Border bawah lebih tebal
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    width: double.infinity, // Agar tombol menyesuaikan lebar container
                    height: double.infinity, // Agar tombol mengisi penuh tinggi container
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPageFul()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Warna tombol
                        foregroundColor: Color(0xFF012385), // Warna teks
                        padding: EdgeInsets.symmetric(vertical: 10), // Tambah tinggi tombol
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Sudut melengkung, sama dengan Container
                        ),
                        elevation: 0, // Menghilangkan efek timbul
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

                
                SizedBox(height: 20,),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'sudah punya akun? silahkan ',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w200,
                          color: Color(0xFF012385),
                        )
                      ),
                      TextSpan(
                        text: 'SignUp',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 255, 31, 136),
                        ),
                      ),
                    ]
                  )
                )
              ]
            )
          )
        ],
      ),
    );
  }
}


class LoginPageFul extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}


class _LoginPage extends State<LoginPageFul> {
  bool isChecked = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username dan password tidak boleh kosong!"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Misalkan username dan password yang benar adalah "admin" dan "1234"
      if (username == "admin" && password == "1234") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login berhasil!"),
            backgroundColor: Colors.green,
          ),
        );
        // Lakukan navigasi ke halaman berikutnya jika perlu
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Username atau password salah!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _goToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPageFul()), // Ganti dengan halaman SignUp yang benar
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 50, right: 50),
          child: Column(
            children: [
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1893FF),
                )
              ),
              SizedBox(height: 30,),
              Text(
                'Masukkan Username dan Password  yang sudah anda daftarkan',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                )
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username :',
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
                controller: _usernameController, // Menangkap input
                decoration: InputDecoration(
                  labelText: '',
                  filled: false,
                  fillColor: Colors.grey[200],
                  suffixIcon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 190, 210, 221), width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password :',
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
                controller: _passwordController, // Menangkap input
                obscureText: true, // Menyembunyikan password
                decoration: InputDecoration(
                  labelText: '',
                  filled: false,
                  fillColor: Colors.grey[200],
                  suffixIcon: Icon(
                    Icons.key,
                    color: Color.fromARGB(255, 190, 210, 221),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 190, 210, 221), width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: CheckboxListTile(
                  title: Text("Remember me",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  )),
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  activeColor: Color(0xFF1893FF),
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                ),
              ),
              SizedBox(height: 5,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _login, // Login Function
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1893FF),
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
                      text: 'jika anda belum meiliki akun, maka silahkan daftar terlebih dahulu. ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.black,
                      )
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color.fromARGB(255, 255, 31, 136),
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
                      top: BorderSide(color: Color.fromARGB(255, 255, 31, 136), width: 1), // Border atas tipis
                      left: BorderSide(color: Color.fromARGB(255, 255, 31, 136), width: 1), // Border kiri tipis
                      right: BorderSide(color: Color.fromARGB(255, 255, 31, 136), width: 1), // Border kanan tipis
                      bottom: BorderSide(color: Color.fromARGB(255, 255, 31, 136), width: 5), // Border bawah lebih tebal
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    onPressed: _goToSignUp, // Pindah ke Sign Up
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
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
                        color: Color.fromARGB(255, 255, 31, 136),
                      ),
                    ),
                  ),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
