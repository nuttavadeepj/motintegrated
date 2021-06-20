import 'package:flutter/material.dart';
import 'package:motintegrated/screens/product_detail.dart';

class AllGas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8ED),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 100,
            child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Biogas 3 liter', '300', 'images/gas.png',
                      'Biogas produced by MOT, which is made from compostable waste, in 3 liter/tank, can be used for cooking instead of gas stove, used for lighting, heating,car engine.', false, context),
                  _buildCard('Biogas 5 liter', '500', 'images/gas.png',
                      'Biogas produced by MOT, which is made from compostable waste, in 5 liter/tank, can be used for cooking instead of gas stove, used for lighting, heating,car engine', false, context),
                  _buildCard('Biogas 10 liter', '1000', 'images/gas.png',
                      'Biogas produced by MOT, which is made from compostable waste, in 10 liter/tank, can be used for cooking instead of gas stove, used for lighting, heating,car engine', false, context),
                ]),
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, String detail,
      bool added, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 5.0),
      child: InkWell(
          onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(
                            assetPath: imgPath,
                            productprice: price,
                            productname: name,
                            productdetail: detail,
                          )),
                )
              },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Hero(
                    tag: imgPath,
                    child: Container(
                        height: 140.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain))),
                  ),
                ),
                SizedBox(height: 2.0),
                Text('${price} ฿',
                    style: TextStyle(color: Color(0xff9D8671), fontSize: 25.0, fontWeight: FontWeight.w500, fontFamily: 'Jost')),
                Text(name,
                    style: TextStyle(color: Color(0xff323232), fontSize: 18.0, fontFamily: 'Jost')),
                
              ],
            ),
          )),
    );
  }
}
