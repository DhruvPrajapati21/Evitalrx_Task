import 'package:evitalrx_task/Authentication/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Usermodel.dart';

class Purchasesscreen extends StatefulWidget {
  const Purchasesscreen({super.key});

  @override
  State<Purchasesscreen> createState() => _PurchasesscreenState();
}

class _PurchasesscreenState extends State<Purchasesscreen> {

  final List<UserModel> _allUsers = [
    UserModel(name: 'Aarav', phone: '9876543210', city: 'Mumbai', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg', rupee: 70),
    UserModel(name: 'Ananya', phone: '8765432109', city: 'Delhi', imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg', rupee: 30),
    UserModel(name: 'Vihaan', phone: '7654321098', city: 'Bengaluru', imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg', rupee: 90),
    UserModel(name: 'Diya', phone: '6543210987', city: 'Chennai', imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg', rupee: 20),
    UserModel(name: 'Ishaan', phone: '5432109876', city: 'Kolkata', imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg', rupee: 50),
    UserModel(name: 'Saanvi', phone: '4321098765', city: 'Hyderabad', imageUrl: 'https://randomuser.me/api/portraits/women/3.jpg', rupee: 60),
    UserModel(name: 'Arjun', phone: '3210987654', city: 'Ahmedabad', imageUrl: 'https://randomuser.me/api/portraits/men/4.jpg', rupee: 40),
    UserModel(name: 'Kavya', phone: '2109876543', city: 'Pune', imageUrl: 'https://randomuser.me/api/portraits/women/4.jpg', rupee: 80),
    UserModel(name: 'Rohan', phone: '1098765432', city: 'Jaipur', imageUrl: 'https://randomuser.me/api/portraits/men/5.jpg', rupee: 10),
    UserModel(name: 'Meera', phone: '0987654321', city: 'Lucknow', imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg', rupee: 55),
    UserModel(name: 'Aditya', phone: '9876501234', city: 'Surat', imageUrl: 'https://randomuser.me/api/portraits/men/6.jpg', rupee: 65),
    UserModel(name: 'Pooja', phone: '8765401234', city: 'Kanpur', imageUrl: 'https://randomuser.me/api/portraits/women/6.jpg', rupee: 25),
    UserModel(name: 'Yash', phone: '7654301234', city: 'Nagpur', imageUrl: 'https://randomuser.me/api/portraits/men/7.jpg', rupee: 35),
    UserModel(name: 'Riya', phone: '6543201234', city: 'Indore', imageUrl: 'https://randomuser.me/api/portraits/women/7.jpg', rupee: 75),
    UserModel(name: 'Karan', phone: '5432101234', city: 'Bhopal', imageUrl: 'https://randomuser.me/api/portraits/men/8.jpg', rupee: 45),
    UserModel(name: 'Neha', phone: '4321001234', city: 'Patna', imageUrl: 'https://randomuser.me/api/portraits/women/8.jpg', rupee: 55),
    UserModel(name: 'Ayaan', phone: '3210001234', city: 'Ludhiana', imageUrl: 'https://randomuser.me/api/portraits/men/9.jpg', rupee: 15),
    UserModel(name: 'Isha', phone: '2100001234', city: 'Agra', imageUrl: 'https://randomuser.me/api/portraits/women/9.jpg', rupee: 25),
    UserModel(name: 'Siddharth', phone: '1090001234', city: 'Vadodara', imageUrl: 'https://randomuser.me/api/portraits/men/10.jpg', rupee: 85),
    UserModel(name: 'Tanya', phone: '0980001234', city: 'Nashik', imageUrl: 'https://randomuser.me/api/portraits/women/10.jpg', rupee: 95),
    UserModel(name: 'Rahul', phone: '9870001234', city: 'Faridabad', imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg', rupee: 35),
    UserModel(name: 'Priya', phone: '9860001234', city: 'Amritsar', imageUrl: 'https://randomuser.me/api/portraits/women/11.jpg', rupee: 20),
    UserModel(name: 'Manav', phone: '9750001234', city: 'Meerut', imageUrl: 'https://randomuser.me/api/portraits/men/12.jpg', rupee: 65),
    UserModel(name: 'Sneha', phone: '9640001234', city: 'Jodhpur', imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg', rupee: 75),
    UserModel(name: 'Raj', phone: '9530001234', city: 'Ranchi', imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg', rupee: 50),
    UserModel(name: 'Simran', phone: '9420001234', city: 'Guwahati', imageUrl: 'https://randomuser.me/api/portraits/women/13.jpg', rupee: 35),
    UserModel(name: 'Dev', phone: '9310001234', city: 'Dehradun', imageUrl: 'https://randomuser.me/api/portraits/men/14.jpg', rupee: 40),
    UserModel(name: 'Anjali', phone: '9200001234', city: 'Raipur', imageUrl: 'https://randomuser.me/api/portraits/women/14.jpg', rupee: 60),
    UserModel(name: 'Kabir', phone: '9100001234', city: 'Noida', imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg', rupee: 95),
    UserModel(name: 'Tara', phone: '9090001234', city: 'Gwalior', imageUrl: 'https://randomuser.me/api/portraits/women/15.jpg', rupee: 30),
    UserModel(name: 'Aryan', phone: '9080001234', city: 'Udaipur', imageUrl: 'https://randomuser.me/api/portraits/men/16.jpg', rupee: 70),
    UserModel(name: 'Mira', phone: '9070001234', city: 'Mysuru', imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg', rupee: 20),
    UserModel(name: 'Nikhil', phone: '9060001234', city: 'Thrissur', imageUrl: 'https://randomuser.me/api/portraits/men/17.jpg', rupee: 85),
    UserModel(name: 'Bhavya', phone: '9050001234', city: 'Vijayawada', imageUrl: 'https://randomuser.me/api/portraits/women/17.jpg', rupee: 25),
    UserModel(name: 'Parth', phone: '9040001234', city: 'Warangal', imageUrl: 'https://randomuser.me/api/portraits/men/18.jpg', rupee: 65),
    UserModel(name: 'Divya', phone: '9030001234', city: 'Madurai', imageUrl: 'https://randomuser.me/api/portraits/women/18.jpg', rupee: 45),
    UserModel(name: 'Rudra', phone: '9020001234', city: 'Vellore', imageUrl: 'https://randomuser.me/api/portraits/men/19.jpg', rupee: 55),
    UserModel(name: 'Avni', phone: '9010001234', city: 'Amravati', imageUrl: 'https://randomuser.me/api/portraits/women/19.jpg', rupee: 50),
    UserModel(name: 'Harsh', phone: '9000001234', city: 'Solapur', imageUrl: 'https://randomuser.me/api/portraits/men/20.jpg', rupee: 60),
    UserModel(name: 'Ira', phone: '8990001234', city: 'Jhansi', imageUrl: 'https://randomuser.me/api/portraits/women/20.jpg', rupee: 40),
    UserModel(name: 'Reyansh', phone: '8880001234', city: 'Gorakhpur', imageUrl: 'https://randomuser.me/api/portraits/men/21.jpg', rupee: 20),
    UserModel(name: 'Naina', phone: '8770001234', city: 'Bareilly', imageUrl: 'https://randomuser.me/api/portraits/women/21.jpg', rupee: 95),
    UserModel(name: 'Jay', phone: '8660001234', city: 'Dhanbad', imageUrl: 'https://randomuser.me/api/portraits/men/22.jpg', rupee: 75),
  ];


  final List<UserModel> _displayedUsers = [];
  final int _recordsPerPage = 20;
  int _currentPage = 0;
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadMoreRecords();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreRecords();
      }
    });
  }

  void _loadMoreRecords() {
    if (_isLoading) return;

    setState(() {
      _isLoading = false;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        final nextPageRecords = _allUsers
            .skip(_currentPage * _recordsPerPage)
            .take(_recordsPerPage)
            .toList();
        _displayedUsers.addAll(nextPageRecords);
        _currentPage++;
        _isLoading = false;
      });
    });
  }


  void _filterUsers() {
    setState(() {
      _displayedUsers.clear();
      _currentPage = 0;
      final filteredUsers = _allUsers.where((user) {
        final query = _searchQuery.toLowerCase();
        return user.name.toLowerCase().contains(query) ||
            user.phone.toLowerCase().contains(query) ||
            user.city.toLowerCase().contains(query);
      }).toList();
      _displayedUsers.addAll(filteredUsers.take(_recordsPerPage));
    });
  }

  bool _onScrollNotification(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollEndNotification &&
        scrollNotification.metrics.extentAfter == 0) {
      _loadMoreRecords();
    }
    return false;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showUpdateStockDialog(BuildContext context, UserModel user) {
    TextEditingController stockController = TextEditingController();
    stockController.text = user.rupee
        .toString();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.blue[50]!.withOpacity(0.97),
          elevation: 25,
          titlePadding: EdgeInsets.only(top: 20, left: 20, right: 20),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.4),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.account_circle, color: Colors.white, size: 30),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Update Rupee for ${user.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.blue[900],
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan.shade50, Colors.blue.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.1),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: 'Enter new amount',
                    labelText: 'New Rupee',
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    prefixIcon: Icon(Icons.currency_rupee, color: Colors.blueAccent),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actionsPadding: EdgeInsets.only(left: 20, right: 20, bottom: 16),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.cancel, color: Colors.redAccent),
              label: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                int newRupee = int.tryParse(stockController.text) ?? 0;
                setState(() {
                  user.rupee = newRupee;
                });
                Fluttertoast.showToast(
                  msg: "Rupee updated to ₹$newRupee",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.check_circle_outline),
              label: Text("Update"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 10,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                ),
                shadowColor: Colors.blueAccent.withOpacity(0.5),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                labelText: 'Filter applied name, phone or city',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _searchQuery = value;
                _filterUsers();
              },
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: _onScrollNotification,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _displayedUsers.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _displayedUsers.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final user = _displayedUsers[index];
                  final ruppeStatus = user.rupee > 50 ? 'High' : 'Low';
                  final sequentialNumber = index + 1;
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    elevation: 4.0,
                    // surfaceTintColor:
                    // Color(hexColor('#FFFFFF')),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                              child: CachedNetworkImage(
                                imageUrl: user.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text('Name: ${user.name}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Phone: ${user.phone}'),
                                Text('City: ${user.city}'),
                                Text('Rupee: ₹${user.rupee} ($ruppeStatus)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    _showUpdateStockDialog(context, user);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                'User Record: $sequentialNumber',
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontStyle: FontStyle.italic,fontSize: 13
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

int hexColor(String color) {
  String newColor = '0xff' + color;
  newColor = newColor.replaceAll('#', '');
  int finalcolor = int.parse(newColor);
  return finalcolor;
}
