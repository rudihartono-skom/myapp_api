import 'package:flutter/material.dart';
import '../services/api-services.dart';
import '../models/user.dart';

class UserList extends StatefulWidget{
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<User>> futureUsers;
  @override
  void initState() {
    super.initState();
    futureUsers = ApiServices().fetchUsers();
  }

  int _selectedIndex = 0;
  static const List<String> _route = <String>[
    '/post',
    '/user',
    '/product',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, _route[_selectedIndex]);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  leading: CircleAvatar(
                    child: Text(user.id.toString()),
                  ),
                  dense: true,
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'User',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Product',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.pink,
      onTap: _onItemTapped,
      ),
    );
  }
}