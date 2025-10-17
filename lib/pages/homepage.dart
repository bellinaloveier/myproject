import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class HoverCategoryItem extends StatefulWidget {
  final String title;
  const HoverCategoryItem({Key? key, required this.title}) : super(key: key);

  @override
  _HoverCategoryItemState createState() => _HoverCategoryItemState();
}

class _HoverCategoryItemState extends State<HoverCategoryItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _isHovering
              ? const Color.fromARGB(255, 254, 70, 132) //warna saat hover
              : Colors.transparent, //warna awal transparan
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey, //border abu-abu
            width: 1.5,
          ),
        ),
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _isHovering ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
final categorylist = [
  "All",
  "Fashion",
  "Beauty",
  "Toys",
  "Books",
  "Music",
  "Home",
  "Garden",
  "Health",
  "Grocery",
  "Pets",
  "Food",
  "Baby",
  "Jewelry",
  "Shoes",
];
final List<String> imageList = [
  'images/rose.png',
  'images/rabbit.png',
  'images/flower.png',
  'images/converse.png',
  'images/koi.png',
];
final List<String> dataTextList = [
  "Promo Terbaru",
  "Diskon 50%",
  "Produk Favorit",
  "Limited Edition",
  "Best Seller",
];
final List<String> contentTextList = [
  "Cek Sekarang!",
  "Hemat lebih banyak hari ini",
  "Lihat Detail",
  "Stok Terbatas",
  "Jangan Lewatkan!",
];
final List<dynamic> productList = [
  {
  'id': 1,
  'name': 'Product 1',
  'image': 'images/rose.png',
  'price': 100.000,
  'description': 'This is a great product.',
  },
  {
    'id': 2,
    'name': 'Product 2', 
    'image': 'images/rabbit.png',
    'price': 200.000,
    'description': 'This is another great product.',
  },
  {
    'id': 3,
    'name': 'Product 3',
    'image': 'images/flower.png',
    'price': 50.000,
    'description': 'This product is also great.',
  },
  {
    'id': 4,
    'name': 'Product 4',
    'image': 'images/converse.png',
    'price': 150.000,
    'description': 'You will love this product.',
  },
  {
    'id': 5,
    'name': 'Product 5',
    'image': 'images/koi.png',
    'price': 300.000,
    'description': 'This is a must-have product.',
  },
];
class _HomePageState extends State<HomePage> {
  final int crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.shopping_bag), label: "Orders"),
      ]),
      appBar: AppBar(
        title: Text("Xue Shop"),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 255, 34, 122),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.notifications_outlined),
              SizedBox(width: 15),
              Icon(Icons.shopping_cart_outlined),
              SizedBox(width: 15), 
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding( 
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder( 
                  borderRadius: BorderRadius.circular(10.0), 
                ),
                prefixIcon: Icon(Icons.search), 
                hintText: "Search ...", 
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            children: [
              for (var i = 0; i < imageList.length; i++)
              SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Container(
              decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 34, 122),
              borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.all(8.0),
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  dataTextList[i],
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
                ),
                Text(
                  contentTextList[i],
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8),
                ),
                Image.asset(
                  imageList[i],
                  height: 120,
                  width: 120,
                ),
              ],
            ),
          ),
        ),
    ],
  ),
),

          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 8.0), 
            child: Text(
              "Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
              )),
          SizedBox(height: 15),
          
          SizedBox(
            height: 40,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              itemCount: categorylist.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 100,
                  child: HoverCategoryItem(title: categorylist[index]),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 8.0), 
            child: Text(
              "Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
              )),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,), 
                itemCount: productList.length,
                itemBuilder: (context, index) {
                return GestureDetector( //tugas berikut tambah onTap seperti di bawa ini tapi perbaiki
                  onTap: () {   //siapkan exam atau laragon atau docer, text editor, install php, postman, nodejs versi baru yg 22, composer
                    Navigator.pushNamed(
                      context, 
                      '/productDetail', 
                      arguments: productList[index],
                    );
                    // Aksi saat produk diklik
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Image.asset(productList[index]['image'], height: 100, width: 100),
                        Text(productList[index]['name']),
                        Text(productList[index]['price'].toString()),
                        Text(productList[index]['description']),
                      ],
                    ),),
                );
              }))
        ],
      ),
    );
  }
}