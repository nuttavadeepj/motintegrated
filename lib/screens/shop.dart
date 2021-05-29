import 'package:flutter/material.dart';
import 'package:motintegrated/screens/product.dart';



class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff4A5F30)),
          onPressed: () {},
        ),
        title: Text('Pickup',
            style: TextStyle(fontSize: 20.0, color: Color(0xff4A5F30))),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Color(0xff4A5F30),
              onPressed: () {})
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 0.0),
        children: <Widget>[
          SizedBox(height: 15),
          Text(
            'Categories',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xff4A5F30),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45),
            unselectedLabelColor: Color(0xffDCDDA6),
            tabs: [
              Tab(
                child: Text(
                  'All',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Trash Bag',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'Gas',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 30.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                Product(),
                Product(),
                Product(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
