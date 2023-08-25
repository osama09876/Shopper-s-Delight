// import 'package:shop_now/Models/Productlist.dart';

class Cart {
  final int? id;
  String? title;
  String? imageUrl1;
  double? initialprice;
  int? count;
  double? totalprice;
  Cart({
    required this.id,
    required this.title,
    required this.imageUrl1,
    required this.initialprice,
    required this.count,
    required this.totalprice,
  });

  // Cart.fromMap(Map<dynamic, dynamic> res)
  //     : id = res['id'],
  //       title = res['title'],
  //       imageUrl1 = res['imageUrl1'],
  //       initialprice = res['initialprice'],
  //       count = res['count'],
  //       totalprice = res['totalprice'];

  // Map<String, Object?> toMap() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'imageUrl1': imageUrl1,
  //     'initialprice': initialprice,
  //     'count': count,
  //     'totalprice': totalprice,
  //   };
  // }
}

// class AddtoCartList {
//   List<AddtoCartModel> cartList = [];
//   void addTocart(Products item, int count) {
//     if (cartList.length > 0) {
//       cartList.forEach((element) {
//         if (element.id == item.id) {
//           count = count + 1;
//         } else {
//           cartList.add(
//             AddtoCartModel(
//               id: item.id,
//               title: item.title,
//               imageUrl1: item.imageUrl1,
//               cost: item.cost,
//               rating: item.rating,
//               count: count,
//             ),
//           );
//         }
//       });
//     }
//   }
// }
