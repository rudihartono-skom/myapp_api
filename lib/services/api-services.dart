import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../models/user.dart';
import '../models/post.dart';

class ApiServices{
  static const String url = 'https://fakestoreapi.com/products';
  static const String UserUrl = 'https://jsonplaceholder.typicode.com/users';
  static const String postUrl = 'https://jsonplaceholder.typicode.com/posts';
  
   Future<List<Product>> fetchProducts() async{
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products = body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<User>> fetchUsers() async{
    final response = await http.get(Uri.parse(UserUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users = body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Post>> fetchPosts() async{
    final response = await http.get(Uri.parse(postUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

 
}