import 'package:flutter/material.dart';
import 'services/api-services.dart';
import '../models/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
   late Future<List<Product>> futureProducts;
  @override
  void initState() {
    super.initState();
    futureProducts = ApiServices().fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder(
        future: futureProducts, 
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Product product = snapshot.data![index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.price.toString()),
                 );
              },
            );
          }
        },
      ),
    );
  }
}