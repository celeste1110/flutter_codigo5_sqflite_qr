import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_sqflite_qr/models/license_model.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/color.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/widget/input_textfield_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../db/db_admin.dart';
import '../ui/general/color.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  String url;


  RegisterPage({required this.url});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dniController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kFontPrimaryColor),
        title: const Text(
          "VacunApp Storage",
          style: TextStyle(
            color: kFontPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Text(
                      "Registrar nuevo carnet",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputFieldWidget(
                      textController: _nameController,

                      text: "Nombres completos",
                      icon: "bx-user",
                      isDNI: false,
                    ),
                    InputFieldWidget(
                      textController: _dniController,
                      text: "DNI",
                      icon: "bx-card",
                      isDNI: true,
                    ),
                    Row(
                      children: [
                        Text(
                          'Carner QR',
                          style: TextStyle(
                            color: kFontPrimaryColor.withOpacity(0.6),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    QrImage(
                      data: widget.url,
                      version: QrVersions.auto,
                      size: 220.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 52.0,
              margin: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBrandPrimaryColor,
                  // primary: Color(0xff04CD8B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                onPressed: () {
                  //
                  //  DBAdmin.db.insertLicenses();

                  if(formKey.currentState!.validate()){
                    LicenseModel licenseModel = LicenseModel(
                      name: _nameController.text,
                      dni: _dniController.text,
                      url: widget.url,
                    );
                    DBAdmin.db.insertLicenses(licenseModel).then((value){
                      if(value>0){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Color(0xff06d6a0),
                            content: Row(
                              children: const [
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('Carnet registrado con exito')
                              ],
                            ),
                          ),
                        );
                        Navigator.pop(context);
                       // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);

                      }
                    });
                  }
                },
                child: const Text(
                  "Finalizar registro",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
