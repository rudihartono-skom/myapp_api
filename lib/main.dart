import 'package:flutter/material.dart';
import 'models/user.dart';
import 'models/post.dart';
import 'models/product.dart';
import 'services/api-services.dart';
import 'pageproduct.dart';
import 'pageuser.dart';
import 'pagepost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserList(),
      routes:
      {
        // '/post': (context) => PostList(),
        '/user': (context) => UserList(),
        '/product': (context) => ProductList(),
      },
    );
  }
}



// class PostList extends StatefulWidget{
//   @override
//   State<PostList> createState() => _PostListState();
// }

// class _PostListState extends State<PostList> {
//   late Future<List<Post>> futurePosts;
//   @override
//   void initState() {
//     super.initState();
//     futurePosts = ApiServices().fetchPosts();
//   }

//   int _selectedIndex = 0;
//   static const List<String> _route = <String>[
//     '/post',
//     '/user',
//     '/product',
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     Navigator.pushNamed(context, _route[_selectedIndex]);
//   }
//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Post List'),
//         backgroundColor: Colors.pink,
//       ),
//       body: FutureBuilder(
//         future: futurePosts, 
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No posts found'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 Post post = snapshot.data![index];
//                 return ListTile(
//                   title: Text(post.title),
//                   subtitle: Text(post.body),
//                 );
//               },
//             );
//           }
//         },

//       ),
//        bottomNavigationBar: BottomNavigationBar(items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'User',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.list),
//           label: 'Product',
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       unselectedItemColor: Colors.grey,
//       selectedItemColor: Colors.pink,
//       onTap: _onItemTapped,
//       ),
//     );
//   }
// }
