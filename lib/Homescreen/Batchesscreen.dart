import 'package:evitalrx_task/Authentication/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Usermodel.dart';

class Batchesscreen extends StatefulWidget {
  const Batchesscreen({super.key});

  @override
  State<Batchesscreen> createState() => _BatchesscreenState();
}

class _BatchesscreenState extends State<Batchesscreen> {

  final List<UserModel> _allUsers = [
    UserModel(name: 'Dhruv', phone: '123456780', city: 'Motera', imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg', rupee: 70),
    UserModel(name: 'Jinal', phone: '2345678901', city: 'Vadaj', imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg', rupee: 30),
    UserModel(name: 'Chetan', phone: '3456789012', city: 'Usmanapura', imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg', rupee: 90),
    UserModel(name: 'Reva', phone: '4567890123', city: 'Cg Road', imageUrl: 'https://randomuser.me/api/portraits/women/14.jpg', rupee: 20),
    UserModel(name: 'Dushyant', phone: '5678901234', city: 'Chandkheda', imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg', rupee: 50),
    UserModel(name: 'Daxa', phone: '6789012345', city: 'Adalaj', imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg', rupee: 60),
    UserModel(name: 'Deepa', phone: '7890123456', city: 'Himatnagar', imageUrl: 'https://randomuser.me/api/portraits/women/17.jpg', rupee: 40),
    UserModel(name: 'Chhagan', phone: '8901234567', city: 'Lal Darwaja', imageUrl: 'https://randomuser.me/api/portraits/men/18.jpg', rupee: 80),
    UserModel(name: 'Mahesh', phone: '9012345678', city: 'Thaltej', imageUrl: 'https://randomuser.me/api/portraits/men/19.jpg', rupee: 10),
    UserModel(name: 'Avina', phone: '0123456789', city: 'Jetalpur', imageUrl: 'https://randomuser.me/api/portraits/women/20.jpg', rupee: 55),
    UserModel(name: 'Umang', phone: '1234567891', city: 'Gandhinagar', imageUrl: 'https://randomuser.me/api/portraits/men/21.jpg', rupee: 65),
    UserModel(name: 'Sandeep', phone: '2345678902', city: 'Mansa', imageUrl: 'https://randomuser.me/api/portraits/men/22.jpg', rupee: 25),
    UserModel(name: 'Jagmal', phone: '3456789013', city: 'Racharda', imageUrl: 'https://randomuser.me/api/portraits/men/23.jpg', rupee: 35),
    UserModel(name: 'Jethalal', phone: '4567890124', city: 'Paldi', imageUrl: 'https://randomuser.me/api/portraits/men/24.jpg', rupee: 75),
    UserModel(name: 'Chandrika', phone: '5678901235', city: 'Bopal', imageUrl: 'https://randomuser.me/api/portraits/women/25.jpg', rupee: 45),
    UserModel(name: 'Urja', phone: '6789012346', city: 'Bhavnagar', imageUrl: 'https://randomuser.me/api/portraits/women/26.jpg', rupee: 55),
    UserModel(name: 'Tej', phone: '7890123457', city: 'Surat', imageUrl: 'https://randomuser.me/api/portraits/men/27.jpg', rupee: 15),
    UserModel(name: 'Ela', phone: '8901234568', city: 'Valsad', imageUrl: 'https://randomuser.me/api/portraits/women/28.jpg', rupee: 25),
    UserModel(name: 'Shivam', phone: '9012345679', city: 'Surendranagar', imageUrl: 'https://randomuser.me/api/portraits/men/29.jpg', rupee: 85),
    UserModel(name: 'Rekha', phone: '0123456780', city: 'Rajkot', imageUrl: 'https://randomuser.me/api/portraits/women/30.jpg', rupee: 95),
    UserModel(name: 'Ashok', phone: '1234567892', city: 'Somnath', imageUrl: 'https://randomuser.me/api/portraits/men/31.jpg', rupee: 35),
    UserModel(name: 'Hiren', phone: '2345678903', city: 'Dwarka', imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg', rupee: 65),
    UserModel(name: 'Henil', phone: '3456789014', city: 'Dakor', imageUrl: 'https://randomuser.me/api/portraits/men/33.jpg', rupee: 5),
    UserModel(name: 'Jenish', phone: '4567890125', city: 'Kheda', imageUrl: 'https://randomuser.me/api/portraits/men/34.jpg', rupee: 45),
    UserModel(name: 'Manish', phone: '5678901236', city: 'Tarapur', imageUrl: 'https://randomuser.me/api/portraits/men/35.jpg', rupee: 55),
    UserModel(name: 'Jenik', phone: '6789012347', city: 'Khambhat', imageUrl: 'https://randomuser.me/api/portraits/men/36.jpg', rupee: 95),
    UserModel(name: 'Rikin', phone: '7890123458', city: 'Aaklav', imageUrl: 'https://randomuser.me/api/portraits/men/37.jpg', rupee: 65),
    UserModel(name: 'Rahul', phone: '8901234569', city: 'Mahudi', imageUrl: 'https://randomuser.me/api/portraits/men/38.jpg', rupee: 35),
    UserModel(name: 'Hemil', phone: '9012345670', city: 'Unja', imageUrl: 'https://randomuser.me/api/portraits/men/39.jpg', rupee: 75),
    UserModel(name: 'Himani', phone: '0123456781', city: 'Siddpur', imageUrl: 'https://randomuser.me/api/portraits/women/40.jpg', rupee: 95),
    UserModel(name: 'Hemangi', phone: '1234567893', city: 'Palanpur', imageUrl: 'https://randomuser.me/api/portraits/women/41.jpg', rupee: 15),
    UserModel(name: 'Om', phone: '2345678904', city: 'Disha', imageUrl: 'https://randomuser.me/api/portraits/men/42.jpg', rupee: 25),
    UserModel(name: 'Ganesh', phone: '3456789015', city: 'Kalupur', imageUrl: 'https://randomuser.me/api/portraits/men/43.jpg', rupee: 85),
    UserModel(name: 'Devarsh', phone: '4567890126', city: 'Jashoda', imageUrl: 'https://randomuser.me/api/portraits/men/44.jpg', rupee: 45),
    UserModel(name: 'Het', phone: '5678901237', city: 'CTM', imageUrl: 'https://randomuser.me/api/portraits/men/45.jpg', rupee: 35),
    UserModel(name: 'Nikhil', phone: '6789012348', city: 'Krishnanagar', imageUrl: 'https://randomuser.me/api/portraits/men/46.jpg', rupee: 5),
    UserModel(name: 'Amin', phone: '7890123459', city: 'Koba', imageUrl: 'https://randomuser.me/api/portraits/men/47.jpg', rupee: 65),
    UserModel(name: 'Deep', phone: '8901234570', city: 'Kapadvanj', imageUrl: 'https://randomuser.me/api/portraits/men/48.jpg', rupee: 75),
    UserModel(name: 'Vansh', phone: '9012345671', city: 'Botad', imageUrl: 'https://randomuser.me/api/portraits/men/49.jpg', rupee: 55),
    UserModel(name: 'Rajesh', phone: '0123456782', city: 'Dhodka', imageUrl: 'https://randomuser.me/api/portraits/men/50.jpg', rupee: 65),
    UserModel(name: 'Parth', phone: '1234567894', city: 'Visalpur', imageUrl: 'https://randomuser.me/api/portraits/men/51.jpg', rupee: 25),
    UserModel(name: 'Varin', phone: '0123456782', city: 'Madarkha', imageUrl: 'https://randomuser.me/api/portraits/men/52.jpg', rupee: 65),
    UserModel(name: 'Ujjawal', phone: '1234567894', city: 'Junaghad', imageUrl: 'https://randomuser.me/api/portraits/men/53.jpg', rupee: 25),
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
