import 'package:flutter/material.dart';
import 'login_page.dart';

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
                        print('link start');
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