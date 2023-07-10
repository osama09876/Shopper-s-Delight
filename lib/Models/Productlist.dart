class Products {
  String? id;
  String? title;
  String? imageUrl1;
  String? imageUrl2;
  String? imageUrl3;
  String? imageUrl4;
  String? desc;
  String? cost;
  String? discount;
  int? qountity;
  String? brand;
  String? rating;
  String? colors;
  Products({
    this.id,
    this.title,
    this.imageUrl1,
    this.imageUrl2,
    this.imageUrl3,
    this.imageUrl4,
    this.desc,
    this.cost,
    this.discount,
    this.qountity,
    this.brand,
    this.rating,
    this.colors,
  });
}

class ProdustListing {
  static List<Products> phoneList = [
    Products(
        id: '1',
        title: 'iphone 13 pro',
        imageUrl1: 'assets/images/iphone13_1.jpg',
        imageUrl2: 'assets/images/iphone13_2.jpg',
        imageUrl3: 'assets/images/iphone13_3.jpg',
        imageUrl4: 'assets/images/iphone13_4.jpg',
        desc:
            'The iPhone 13 Pro and Pro Max use an Apple-designed A15 Bionic processor featuring a 16-core neural engine, 6-core CPU (with 2 performance cores and 4 efficiency cores), and 5-core GPU. The A15 Bionic also contains a next-generation image processor.',
        cost: "100",
        brand: 'Iphone',
        colors: 'Black',
        discount: '40%',
        qountity: 8,
        rating: '4.9'),
    Products(
        id: '2',
        title: 'Iphone 12 pro',
        imageUrl1: 'assets/images/iphone12_1.jpg',
        imageUrl2: 'assets/images/iphone12_2.jpg',
        imageUrl3: 'assets/images/iphone12_3.jpg',
        imageUrl4: 'assets/images/iphone12_4.jpg',
        desc:
            "The iPhone 12 Pro uses Apple's six-core A14 Bionic processor, which contains a 16-core neural engine. It has three internal storage options: 128, 256, and 512 GB. The iPhone 12 Pro has an IP68 water and dust-resistant rating along with dirt and grime, and is water-resistant up to six meters (20 feet) for 30 minutes.",
        cost: "100",
        brand: 'Iphone',
        colors: 'Black',
        discount: '40%',
        qountity: 8,
        rating: '4.7'),
    Products(
        id: '3',
        title: 'Realme narzo 50',
        imageUrl1: '',
        imageUrl2: '',
        imageUrl3: '',
        imageUrl4: '',
        desc:
            'The iPhone 13 Pro and Pro Max use an Apple-designed A15 Bionic processor featuring a 16-core neural engine, 6-core CPU (with 2 performance cores and 4 efficiency cores), and 5-core GPU. The A15 Bionic also contains a next-generation image processor.',
        cost: "100",
        brand: 'Iphone',
        colors: 'Black',
        discount: '40%',
        qountity: 8,
        rating: '4.8'),
    // Products(
    //     id: '01',
    //     title: 'iphone 13 pro',
    //     imageUrl1: '',
    //     imageUrl2: '',
    //     imageUrl3: '',
    //     imageUrl4: '',
    //     desc:
    //         'The iPhone 13 Pro and Pro Max use an Apple-designed A15 Bionic processor featuring a 16-core neural engine, 6-core CPU (with 2 performance cores and 4 efficiency cores), and 5-core GPU. The A15 Bionic also contains a next-generation image processor.',
    //     cost: "100",
    //     brand: 'Iphone',
    //     colors: 'Black',
    //     discount: '40%',
    //     qountity: 8,
    //     rating: '4.9'),
    // Products(
    //     id: '01',
    //     title: 'iphone 13 pro',
    //     imageUrl1: '',
    //     imageUrl2: '',
    //     imageUrl3: '',
    //     imageUrl4: '',
    //     desc:
    //         'The iPhone 13 Pro and Pro Max use an Apple-designed A15 Bionic processor featuring a 16-core neural engine, 6-core CPU (with 2 performance cores and 4 efficiency cores), and 5-core GPU. The A15 Bionic also contains a next-generation image processor.',
    //     cost: "100",
    //     brand: 'Iphone',
    //     colors: 'Black',
    //     discount: '40%',
    //     qountity: 8,
    //     rating: '4.9'),
  ];
}
