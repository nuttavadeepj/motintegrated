import 'package:flutter/material.dart';
import 'package:motintegrated/screens/allgas.dart';
import 'package:motintegrated/screens/cart.dart';
import 'package:motintegrated/screens/product.dart';
import 'package:motintegrated/screens/allbag.dart';
import 'package:motintegrated/screens/home.dart';
import 'package:motintegrated/widgets/hamburger.dart';

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
      drawer: NavigationDrawerWidget(), 
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF4A5F30)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios, color: Color(0xFF323232), size: 20.0,),
        //   onPressed: () => {
        //    Navigator.pop(context)
        //   },
        // ),
        title: Text('Pickup',
            style: TextStyle(
              color: Color(0xFF323232), fontSize: 21, fontFamily: 'Jost')),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_basket),
              iconSize: 28.0,
              color: Color(0xFF323232),
              onPressed: () => {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            )
              })
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 0.0),
        children: <Widget>[
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'Jost'),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xff4A5F30),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45),
              unselectedLabelColor: Color(0xffC4C4C4),
              tabs: [
                Tab(
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                  ),
                ),
                Tab(
                  child: Text(
                    'Trash Bag',
                    style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                  ),
                ),
                Tab(
                  child: Text(
                    'Gas',
                    style: TextStyle(fontSize: 20, fontFamily: 'Jost'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 170.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                Product(),
                AllBag(),
                AllGas()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
