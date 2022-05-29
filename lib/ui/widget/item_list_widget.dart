
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/models/license_model.dart';
import 'package:flutter_svg/svg.dart';

import '../general/color.dart';

class ItemListWidget extends StatelessWidget {
  // String name;
  // String dni;
  // String url;
LicenseModel license;
Function onPressed;
  ItemListWidget({required this.license, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(4, 4),
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/bx-user.svg',
                      color: kFontPrimaryColor,
                      height: 13,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'name',
                      style: TextStyle(
                          color: kFontPrimaryColor.withOpacity(0.6),
                          fontSize: 13),
                    ),
                  ],
                ),
                Text(
                  license.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/bx-id-card.svg',
                      color: kFontPrimaryColor,
                      height: 13,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Nro DNI',
                      style: TextStyle(
                          color: kFontPrimaryColor.withOpacity(0.6),
                          fontSize: 13),
                    ),
                  ],
                ),
                Text(license.dni),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onPressed();
            },
            icon: SvgPicture.asset(
              'assets/icon/bx-link-alt.svg',

            ),
          ),
        ],
      ),
    );
  }
}
