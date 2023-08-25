import 'package:flutter/material.dart';
// import 'package:shop_now/Models/ApiModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/Models/FavModel.dart';
import 'package:shop_now/Models/Payment.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shop_now/Models/DBHelper.dart';
import 'package:shop_now/Models/Productlist.dart';

import '../Models/AddToCartModel.dart';

class CartProvider with ChangeNotifier {
  // DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int get counter => _counter;

  int _balance = 30000;
  int get balance => _balance;

  int _total = 0;
  int get totalprice => _total;

  int _count = 1;
  int get count => _count;

  void balanceDetection(int price) {
    _balance = _balance - price;
    notifyListeners();
  }

  late List<Cart> _cartlist = [];
  List<Cart> get cartlist => _cartlist;

  late List<FavModel> _favlist = [];
  List<FavModel> get favlist => _favlist;

  int get totalPrice {
    int total = 0;
    for (var item in _cartlist) {
      total = total + item.totalprice!.toInt();
    }
    return total;
  }

  void emptyList() {
    _cartlist.clear();
  }

  void addData(Products item, int count, double totalprice) async {
    // _cart = dbHelper.getList();
    final existingItemIndex =
        _cartlist.indexWhere((existingItem) => existingItem.id == item.id);
    if (existingItemIndex != -1) {
      _cartlist[existingItemIndex].count = count + 1;
    } else {
      _cartlist.add(
        Cart(
          id: item.id,
          title: item.title,
          imageUrl1: item.imageUrl1,
          initialprice: item.cost,
          count: count,
          totalprice: totalprice,
        ),
      );
    }

    notifyListeners();
  }

  // void addData1(ApiModel item, int count, double totalprice) async {
  //   // _cart = dbHelper.getList();
  //   final existingItemIndex =
  //       _cartlist.indexWhere((existingItem) => existingItem.id == item.id);
  //   if (existingItemIndex != -1) {
  //     _cartlist[existingItemIndex].count = count + 1;
  //   } else {
  //     _cartlist.add(
  //       Cart(
  //         id: item.id,
  //         title: item.title,
  //         imageUrl1: item.images,
  //         initialprice: item.price!.toDouble(),
  //         count: count,
  //         totalprice: totalprice,
  //       ),
  //     );
  //   }

  //   notifyListeners();
  // }

  void addfavData(Products item) async {
    _favlist.add(
      FavModel(
        id: item.id,
        title: item.title,
        imageUrl1: item.imageUrl1,
        cost: item.cost,
        rating: item.rating,
      ),
    );

    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _cartlist.length) {
      cartlist.removeAt(index);
      notifyListeners();
    }
  }

  void removefavItem(int index) {
    if (index >= 0 && index < _favlist.length) {
      favlist.removeAt(index);
      notifyListeners();
    }
  }

  void countZero() {
    _count = 1;
    notifyListeners();
  }

  List<PaymentDetails> _paymentDetailslist = [];
  List<PaymentDetails> get paymentDetailslist => _paymentDetailslist;

  void paymentdetails(DateTime data, int amount) {
    _paymentDetailslist.add(
      PaymentDetails(
        amount: amount,
        paymentDate: data,
      ),
    );
  }
}
