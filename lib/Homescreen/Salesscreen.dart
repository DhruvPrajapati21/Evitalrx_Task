import 'package:evitalrx_task/Authentication/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'Usermodel.dart';

class Salesscreen extends StatefulWidget {
  const Salesscreen({super.key});

  @override
  State<Salesscreen> createState() => _SalesscreenState();
}

class _SalesscreenState extends State<Salesscreen> {

  final List<UserModel> _allUsers = [
    UserModel(name: 'Vivaan', phone: '9988776655', city: 'Mumbai', imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg', rupee: 85),
    UserModel(name: 'Nisha', phone: '8765432109', city: 'Vadodara', imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg', rupee: 30),
    UserModel(name: 'Rohan', phone: '7654321098', city: 'Surat', imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg', rupee: 90),
    UserModel(name: 'Isha', phone: '6543210987', city: 'Rajkot', imageUrl: 'https://randomuser.me/api/portraits/women/4.jpg', rupee: 20),
    UserModel(name: 'Karan', phone: '5432109876', city: 'Gandhinagar', imageUrl: 'https://randomuser.me/api/portraits/men/5.jpg', rupee: 50),
    UserModel(name: 'Ritika', phone: '4321098765', city: 'Bhavnagar', imageUrl: 'https://randomuser.me/api/portraits/women/6.jpg', rupee: 60),
    UserModel(name: 'Vikas', phone: '3210987654', city: 'Jamnagar', imageUrl: 'https://randomuser.me/api/portraits/men/7.jpg', rupee: 40),
    UserModel(name: 'Priya', phone: '2109876543', city: 'Anand', imageUrl: 'https://randomuser.me/api/portraits/women/8.jpg', rupee: 80),
    UserModel(name: 'Harshil', phone: '1098765432', city: 'Bharuch', imageUrl: 'https://randomuser.me/api/portraits/men/9.jpg', rupee: 10),
    UserModel(name: 'Meera', phone: '1987654321', city: 'Mehsana', imageUrl: 'https://randomuser.me/api/portraits/women/10.jpg', rupee: 55),
    UserModel(name: 'Dev', phone: '2233445566', city: 'Nadiad', imageUrl: 'https://randomuser.me/api/portraits/men/11.jpg', rupee: 65),
    UserModel(name: 'Simran', phone: '3344556677', city: 'Morbi', imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg', rupee: 25),
    UserModel(name: 'Jay', phone: '4455667788', city: 'Veraval', imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg', rupee: 70),
    UserModel(name: 'Neha', phone: '5566778899', city: 'Valsad', imageUrl: 'https://randomuser.me/api/portraits/women/14.jpg', rupee: 45),
    UserModel(name: 'Anuj', phone: '6677889900', city: 'Junagadh', imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg', rupee: 35),
    UserModel(name: 'Diya', phone: '7788990011', city: 'Navsari', imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg', rupee: 75),
    UserModel(name: 'Manav', phone: '8899001122', city: 'Palanpur', imageUrl: 'https://randomuser.me/api/portraits/men/17.jpg', rupee: 60),
    UserModel(name: 'Tanya', phone: '9900112233', city: 'Amreli', imageUrl: 'https://randomuser.me/api/portraits/women/18.jpg', rupee: 95),
    UserModel(name: 'Yash', phone: '1011121314', city: 'Jetpur', imageUrl: 'https://randomuser.me/api/portraits/men/19.jpg', rupee: 20),
    UserModel(name: 'Pooja', phone: '1112131415', city: 'Dahod', imageUrl: 'https://randomuser.me/api/portraits/women/20.jpg', rupee: 50),
    UserModel(name: 'Rajat', phone: '1213141516', city: 'Gondal', imageUrl: 'https://randomuser.me/api/portraits/men/21.jpg', rupee: 85),
    UserModel(name: 'Sneha', phone: '1314151617', city: 'Botad', imageUrl: 'https://randomuser.me/api/portraits/women/22.jpg', rupee: 65),
    UserModel(name: 'Aarav', phone: '1415161718', city: 'Porbandar', imageUrl: 'https://randomuser.me/api/portraits/men/23.jpg', rupee: 40),
    UserModel(name: 'Kajal', phone: '1516171819', city: 'Kheda', imageUrl: 'https://randomuser.me/api/portraits/women/24.jpg', rupee: 30),
    UserModel(name: 'Parth', phone: '1617181920', city: 'Modasa', imageUrl: 'https://randomuser.me/api/portraits/men/25.jpg', rupee: 55),
    UserModel(name: 'Sonal', phone: '1718192021', city: 'Deesa', imageUrl: 'https://randomuser.me/api/portraits/women/26.jpg', rupee: 25),
    UserModel(name: 'Naman', phone: '1819202122', city: 'Patan', imageUrl: 'https://randomuser.me/api/portraits/men/27.jpg', rupee: 35),
    UserModel(name: 'Bhavya', phone: '1920212223', city: 'Surendranagar', imageUrl: 'https://randomuser.me/api/portraits/women/28.jpg', rupee: 45),
    UserModel(name: 'Arjun', phone: '2021222324', city: 'Dhoraji', imageUrl: 'https://randomuser.me/api/portraits/men/29.jpg', rupee: 60),
    UserModel(name: 'Ira', phone: '2122232425', city: 'Kalol', imageUrl: 'https://randomuser.me/api/portraits/women/30.jpg', rupee: 90),
    UserModel(name: 'Ayan', phone: '2223242526', city: 'Mandvi', imageUrl: 'https://randomuser.me/api/portraits/men/31.jpg', rupee: 70),
    UserModel(name: 'Jaya', phone: '2324252627', city: 'Kandla', imageUrl: 'https://randomuser.me/api/portraits/women/32.jpg', rupee: 80),
    UserModel(name: 'Rudra', phone: '2425262728', city: 'Dwarka', imageUrl: 'https://randomuser.me/api/portraits/men/33.jpg', rupee: 85),
    UserModel(name: 'Kiara', phone: '2526272829', city: 'Khambhat', imageUrl: 'https://randomuser.me/api/portraits/women/34.jpg', rupee: 65),
    UserModel(name: 'Ishan', phone: '2627282930', city: 'Limbdi', imageUrl: 'https://randomuser.me/api/portraits/men/35.jpg', rupee: 50),
    UserModel(name: 'Myra', phone: '2728293031', city: 'Sanand', imageUrl: 'https://randomuser.me/api/portraits/women/36.jpg', rupee: 55),
    UserModel(name: 'Kabir', phone: '2829303132', city: 'Palitana', imageUrl: 'https://randomuser.me/api/portraits/men/37.jpg', rupee: 30),
    UserModel(name: 'Anaya', phone: '2930313233', city: 'Una', imageUrl: 'https://randomuser.me/api/portraits/women/38.jpg', rupee: 60),
    UserModel(name: 'Aditya', phone: '3031323334', city: 'Talaja', imageUrl: 'https://randomuser.me/api/portraits/men/39.jpg', rupee: 40),
    UserModel(name: 'Trisha', phone: '3132333435', city: 'Viramgam', imageUrl: 'https://randomuser.me/api/portraits/women/40.jpg', rupee: 45),
    UserModel(name: 'Reyansh', phone: '3233343536', city: 'Vapi', imageUrl: 'https://randomuser.me/api/portraits/men/41.jpg', rupee: 35),
    UserModel(name: 'Rhea', phone: '3334353637', city: 'Kapadvanj', imageUrl: 'https://randomuser.me/api/portraits/women/42.jpg', rupee: 75),
    UserModel(name: 'Arav', phone: '3435363738', city: 'Zalod', imageUrl: 'https://randomuser.me/api/portraits/men/43.jpg', rupee: 65),
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
