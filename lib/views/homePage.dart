import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mercado_libre/api_service.dart';
import 'package:mercado_libre/models/product.dart';
import 'package:mercado_libre/views/carrito.dart';
import 'package:mercado_libre/views/detallesProductos.dart';
import 'package:mercado_libre/widgets/productCard.dart';
import 'package:mercado_libre/widgets/productList.dart';
import '../widgets/anuncios.dart';
import '../widgets/categoryCard.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Product>> products;
  List<Product> productsFromApi = [];

  @override
  void initState() {
    super.initState();
    ApiService.fetchProducts().then((apiProducts) {
      setState(() {
        productsFromApi = apiProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarExample(
      
        scaffoldKey: _scaffoldKey, productsFromApi: productsFromApi);
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample(
      {Key? key, required this.scaffoldKey, required this.productsFromApi});

  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Product> productsFromApi;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 50,
        titleSpacing: 8,
        title: Container(
          height: 40,
          width: 440,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            color: Colors.white,
          ),
          child: Container(
            child: const TextField(
              style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar en Mercado libre',
              ),
            ),
          ),
        ),
        
        backgroundColor: Colors.yellowAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarritoView()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Icon(Icons.location_pin, size: 17),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Text(
                    'CP 97800',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                "Antonio",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                "antonio@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://www.record.com.mx/sites/default/files/articulos/2022/12/12/fje0w-yvsaa0zex-08.jpg",
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Buscar'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificaciones'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Mis compras'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favoritos'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.local_offer_sharp),
              title: Text('Ofertas'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.credit_score),
              title: Text('Credito'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.subscriptions),
              title: Text('Suscripciones'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.video_file),
              title: Text('Mercado Play'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Historial'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Mi cuenta'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.yellowAccent,
                      Color.fromARGB(255, 222, 221, 221),
                    ],
                    stops: [0.1, 1.0],
                  ),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 17 / 9,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 150),
                  ),
                  items: <Widget>[
                    anunciosCard(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgnJ2B1ajTxHOnLQGlnONgtwyUNoXhm0WCEQ&usqp=CAU',
                    ),
                    anunciosCard(
                      image:
                          'https://cloudfront-us-east-1.images.arcpublishing.com/sdpnoticias/OO2NN26LBRGP7C322WQIDS2G7I.webp',
                    ),
                    anunciosCard(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2uwXMbqDnF9lZHWmxOa1PE-WRFPfA_eUtRQ&usqp=CAU',
                    ),
                    anunciosCard(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw4sWVRhW_u3qhWU5B0SMv-5ppQJdfnheODA&usqp=CAU',
                    ),
                    anunciosCard(
                      image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf01gxmz8t0lYB6kxnUdTd22WYNbYMecFg6Q&usqp=CAU',
                    ),
                  ],
                ),
              ),
            ),

            Container(
              color: Color.fromARGB(189, 214, 210, 210),
              height: 30,
              width: 470,
              child: Card(
                margin:EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                
                color: Color.fromARGB(255, 186, 7, 218),
                child: Text('Consigue envíos gratis en más productos con Meli+',style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 9,child: Container(color:Color.fromARGB(189, 214, 210, 210),)),

            //////Contenedor de Lista de categorias
            Container(
              color: Color.fromARGB(189, 214, 210, 210),
              child: Container(
                color: Colors.transparent,
                height: 95,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      imagenUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3dDNa0eElg0WgUeJb7EhObp2_LZHx1uLKxg&usqp=CAU',
                          nameCategory: 'Celulares',
                    ),
                    CategoryCard(
                      imagenUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwpnyHgNNoJdaX-eQhcox5SaYxnJHYSFg1papf0WAnrzZwWogmBJX0rDDKDw_931tA6gA&usqp=CAU',
                          nameCategory: 'Super',
                    ),
                    CategoryCard(
                      imagenUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ipadRioXXiardMC7TApwkEVVgfPd6Hq_rA&usqp=CAU',
                          nameCategory: 'Moda',
                    ),
                    CategoryCard(
                      imagenUrl:
                          'https://caribbeanautopr.com/wp-content/uploads/2020/06/Vehi%CC%81culos-Hyundai-recomendados-para-el-2020.jpg',
                          nameCategory: 'Vehículos',
                    ),
                    CategoryCard(
                      imagenUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO_4kh771LUogBo26WNgMwRAESGCpu7zTrFQ&usqp=CAU',
                          nameCategory: 'Computación',
                    ),
                    CategoryCard(
                      imagenUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxs6RA92tQc8lacJNOlZev3UCipe_9htNj1Q&usqp=CAU',
                          nameCategory: 'Celulares',
                    ),
                  ],
                ),
              ),
            ),
          
            Container(
              height: 260,
              color: Color.fromARGB(189, 214, 210, 210),
              padding: EdgeInsets.all(6),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productsFromApi.length,
                itemBuilder: (context, index) {
                  final product = productsFromApi[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> detalleProducto(product:product)));
                    },
                    child: ProductCard(
                      product: product)
                      );
                },
              ),
            ),

            Container(
              color: Color.fromARGB(189, 214, 210, 210),
              height: 500,
              child: Card(
                elevation: 0,
                color: Colors.white,
                margin: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Inspirado en lo último que viste',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    //contenedot de visto ultimamente 
                    Container(
                      height: 400,
                      child: ListView.builder(
                        itemCount: productsFromApi.length,
                        itemBuilder: (context, index) {
                          final product = productsFromApi[index];
                          return vistoUltimamente(
                            image: product.image,
                            title: product.title,
                           // price: '\$${product.price.toString()}',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
