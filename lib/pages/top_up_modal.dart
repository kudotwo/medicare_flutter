import 'package:flutter/material.dart';
import 'wallet_balance.dart';

class TopUpModal extends StatefulWidget {
  const TopUpModal({super.key});

  @override
  State<TopUpModal> createState() => _TopUpModalState();
}

class _TopUpModalState extends State<TopUpModal> {
  void _walletCounter50k() {
    setState(() {
      WalletBalance.balance.value += 50000; // or 100000, etc.
      Navigator.pop(context); // if you want to close modal after top-up
      // _walletAmount += 50000;
    });
  }

  void _walletCounter100k() {
    setState(() {
      WalletBalance.balance.value += 100000; // or 100000, etc.
      Navigator.pop(context);
      // _walletAmount += 100000;
    });
  }

  void _walletCounter150k() {
    setState(() {
      WalletBalance.balance.value += 150000; // or 100000, etc.
      Navigator.pop(context);
      // _walletAmount += 150000;
    });
  }

  void _walletCounter200k() {
    setState(() {
      WalletBalance.balance.value += 200000; // or 100000, etc.
      Navigator.pop(context);
      // _walletAmount += 200000;
    });
  }

  void _walletCounterReset() {
    setState(() {
      // _walletAmount = 100000;
      WalletBalance.balance.value = 0; // or 100000, etc.
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text(
              'Pick amount to Top Up',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          SizedBox(height: 30),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      _walletCounter50k();
                    },
                    child: Text(
                      'Rp50.000',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _walletCounter100k();
                    },
                    child: Text(
                      'Rp100.000',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      _walletCounter150k();
                    },
                    child: Text(
                      'Rp150.000',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _walletCounter200k();
                    },
                    child: Text(
                      'Rp200.000',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  OutlinedButton(
                    onPressed: () {
                      _walletCounterReset();
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       'Rp' + _walletAmount.toString(),
              //       style: TextStyle(fontSize: 20),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
