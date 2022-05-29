import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/color.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Tu carnet de vacunacion',
              style: TextStyle(
                fontSize: 46,
                height: 1,
                fontWeight: FontWeight.w800,
                color: Color(0xff2A2B30),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Con esta App podras gestionar los carnets de las personas que mas prefieras. No olvides ser responsable.',
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                fontWeight: FontWeight.w500,
                color: Color(0xff2A2B30),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBrandPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Text(
                  'Iniciar ahora',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
