import 'package:app2/constants/Warna.dart';
import 'package:app2/constants/constants.dart';
import 'package:flutter/material.dart';

class AlatMusik extends StatefulWidget {
  @override
  _AlatMusikState createState() => _AlatMusikState();
}

class _AlatMusikState extends State<AlatMusik> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,

      height: 180, //mengatur tinggi box
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 150, //mengatur panjang bagian atas box
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Warna.biruLangit,
              boxShadow: [kDefaultShadow],
            ),
            //menambahkan box diatas imagebox 1
            // box putih untuk label
            child: Container(
              margin: EdgeInsets.only(right: 160),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          //gambar pada imagebox 1
          Positioned(
            top: 10,
            right: 0,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.all(8),
              height: 170,
              //imagenya is square
              width: 180,
              child: Image.asset(
                "assets/images/gendang.png",
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            height: 150,
            child: SizedBox(
              height: 100, //tinggi teks dan
              width: size.width - 200,
              //bagian teks dan tombol detail
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16), //padding vutton detail
                    child: Text(
                      "Gendang Melayu",
                      style: TextStyle(
                          fontSize: 20,
                          color: kTextColor,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 1,
                        vertical: kDefaultPadding / 4,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ), //background
                      child: Text(
                        "Detail",
                        style: TextStyle(
                            fontSize: 18,
                            color: kBackgroundColor,
                            fontFamily: 'Poppins'),
                        // Theme.of(context).textTheme.button,
                      ),
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
