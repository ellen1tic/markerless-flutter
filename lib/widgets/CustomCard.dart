import 'package:app2/constants/Warna.dart';
import 'package:app2/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final routes;
  const CustomCard({Key key, this.text, this.routes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      // color: Colors.blueAccent,
      height: 120, //mengatur tinggi box
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            // height: 120, //mengatur panjang bagian atas box
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Warna.biruLangit,
              boxShadow: [kDefaultShadow],
            ),
            //menambahkan box diatas imagebox 1
            // box putih untuk label
            child: Container(
              margin: EdgeInsets.only(right: size.width - (size.width - 16)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          //gambar pada imagebox 1
          Container(
            child: InkWell(
              onTap: () {
                routes();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.all(16), //padding vutton detail
                    child: Text(
                      text,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 28,
                          color: kTextColor,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
