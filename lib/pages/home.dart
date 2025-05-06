import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/models/medicine_list.dart';
import 'package:medicare/pages/top_up_modal.dart';
import 'wallet_balance.dart';
// import 'dart:math';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MedicineList> medicine = [];

  void _getInitialInfo() {
    medicine = MedicineList.getMedicine();
  }

  void _openModalBottomSheet() {
    showModalBottomSheet(context: context, builder: (ctx) => TopUpModal());
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F7),
      body: ListView(
        children: [
          helloUser(),
          SizedBox(width: 25),
          howAreYou(),
          SizedBox(height: 35),
          searchBar(),
          SizedBox(height: 15),
          walletBalance(),
          SizedBox(height: 15),
          speakToCura(),
          SizedBox(height: 15),
          buyMedicine(),
          SizedBox(height: 15),
          medicineList(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        indicatorColor: Color.fromARGB(255, 199, 239, 220),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          // NavigationDestination(icon: Icon(Icons.chat), label: 'Cura'),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Container medicineList() {
    return Container(
      height: 250,
      // color: Colors.green,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 25, right: 25),
        itemCount: medicine.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 25),
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 217, 217, 217),
              color: Color.fromARGB(79, 139, 201, 169),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 30),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 217, 217, 217),
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(medicine[index].iconPath),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            medicine[index].name,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 58, 119, 91),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            medicine[index].price,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 58, 119, 91),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.add, color: Color.fromARGB(255, 58, 119, 91)),
                  ],
                ),

                // SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding buyMedicine() {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(
        "Buy Medicine",
        style: TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 30,
          fontWeight: FontWeight.w400,
          color: Color(0xFF6BB895),
        ),
      ),
    );
  }

  InkWell speakToCura() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/chatbot');
      },
      borderRadius: BorderRadius.circular(10),
      // customBorder: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      // customBorder: Border.all(width: 2),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Ink(
          height: 120,
          width: 30,
          // margin: const EdgeInsets.only(left: 15, right: 15),
          // padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 221, 242, 224),
                Color.fromARGB(127, 107, 184, 149),
              ],
              stops: [0.2, 0.85],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              transform: GradientRotation(2),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              "Speak to Cura",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container walletBalance() {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(left: 15, right: 15),
      // padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF6BB895)),
        borderRadius: BorderRadius.circular(40),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // padding: EdgeInsets.only(top: 24, left: 15),
        children: [
          ValueListenableBuilder<int>(
            valueListenable: WalletBalance.balance,
            builder: (context, value, _) {
              return Text(
                'Rp${value.toString()}',
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              );
            },
          ),
          // Text(
          //   'Rp100.000',
          //   style: TextStyle(
          //     fontFamily: 'WorkSans',
          //     color: Colors.black,
          //     fontSize: 16,
          //     fontWeight: FontWeight.w200,
          //   ),
          // ),
          SizedBox(width: 50),
          VerticalDivider(color: Colors.black, thickness: 0.8),
          SizedBox(width: 60),
          Column(
            // mainAxisAlignment: MainAxisAlignment.c,
            children: [
              IconButton(
                onPressed: _openModalBottomSheet,
                icon: Icon(Icons.wallet, color: Colors.black, size: 32),
              ),
              Text(
                'Top Up',
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Color(0xFFF4F5F7),
          filled: true,
          hintText: 'Search Medicine',
          hintStyle: TextStyle(
            fontSize: 18,
            fontFamily: 'WorkSans',
            color: Color(0xffDDDADA),
          ),
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.search, color: Color(0xFF0C181B), size: 28),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Color(0xFF6BB895)),
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(30),
          //   borderSide: BorderSide(color: Color ),
          // ),
        ),
      ),
    );
  }

  Row howAreYou() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'How are you\nfeeling today?',
            style: TextStyle(
              fontFamily: 'WorkSans',
              color: Color(0xFF6BB895),
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
  }

  Padding helloUser() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Hello (Sam!)',
              style: TextStyle(
                fontFamily: 'WorkSans',
                color: Color(0xFF6BB895),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(width: 40),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket),
            color: Color(0xFF6BB895),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Color(0xFF6BB895),
          ),
        ],
      ),
    );
  }

  //Modal
}
