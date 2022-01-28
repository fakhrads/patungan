import 'package:flutter/material.dart';

//import Home Screen
import './views/home/Home.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Patungan",
                          style: TextStyle(color: Colors.white, fontSize: 48),
                        ),
                        Text(
                          "Atur pembagian mu dengan kawanmu agar teciptanya keadilan bagi negeri ini",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          },
                          child: const Text('Lanjutkan Ke Aplikasi'),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
