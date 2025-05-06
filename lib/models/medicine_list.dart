// import 'package:flutter/material.dart';

class MedicineList {
  String name;
  String iconPath;
  String price;

  MedicineList({
    required this.name,
    required this.iconPath,
    required this.price,
  });

  static List<MedicineList> getMedicine() {
    List<MedicineList> medicine = [];

    medicine.add(
      MedicineList(
        name: 'Neozep',
        iconPath: 'assets/images/neozep.jpeg',
        price: 'Rp5.000',
      ),
    );

    medicine.add(
      MedicineList(
        name: 'Sanmol',
        iconPath: 'assets/images/sanmol.jpeg',
        price: 'Rp7.000',
      ),
    );

    medicine.add(
      MedicineList(
        name: 'Panadol',
        iconPath: 'assets/images/panadol.jpg',
        price: 'Rp3.000',
      ),
    );

    return medicine;
  }
}
