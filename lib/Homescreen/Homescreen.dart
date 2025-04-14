import 'package:evitalrx_task/Authentication/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Batchesscreen.dart';
import 'Purchasesscreen.dart';
import 'Salesscreen.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: const [
            Icon(Icons.exit_to_app, color: Colors.blueAccent),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Exit EvitalRx App?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        content: const Text(
          'Are you sure you want to exit?',
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[700],
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
            ),
            child: const Text('Cancel'),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(true),
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Exit'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: const [
              Icon(Icons.logout, color: Colors.blueAccent),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Logout EvitalRx App?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman"
                  ),
                ),
              ),
            ],
          ),
          content: const Text(
            "Are you sure you want to logout?",
            style: TextStyle(fontSize: 16),
          ),
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[700],
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                _logout(context);
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child:  DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.blue,
              pinned: true,
              centerTitle: true,
              title: const Text(
                "Homescreen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              actions: [
                PopupMenuButton<String>(
                  icon: Row(
                    children: const [
                      Text(
                        "More",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.more_vert, color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  ),
                  onSelected: (value) {
                    if (value == 'logout') {
                      showLogoutConfirmationDialog(context);
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.green),
                          SizedBox(width: 8),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],

              expandedHeight: 425,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.blueAccent,
                  padding: const EdgeInsets.fromLTRB(16, 100, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/dm.png',
                              width: 80, height: 80),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Dolokind Gel',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text('1 Tube of 20 Gm',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70)),
                                Text('Mankind',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Salt Composition',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const Text(
                        'Menthol (5%w/w) + Diclofenac (1.16%w/w) + Capsaicin (0.025%w/w) + Salicylate (5%w/w)',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _buildInfoBox("Min. Stock", "0"),
                          _buildInfoBox("Max. Stock", "0"),
                          _buildInfoBox("Stock", "-101", showStockArrow: true),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.fact_check,
                              size: 18,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          _buildInfoBox("Default Discount", "5%"),
                          _buildInfoBox("Location", "-"),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: ColoredBox(
                  color: Color(0xFFedf0f0),
                  child: TabBar(
                    labelColor: Colors.cyan,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.cyan,
                    tabs: [
                      Tab(text: 'Batches'),
                      Tab(text: 'Purchases'),
                      Tab(text: 'Sales'),
                    ],
                  ),
                ),
              ),
            )
          ],
          body: const TabBarView(
            children: [
              Batchesscreen(),
              Purchasesscreen(),
              Salesscreen()
            ],
          ),
        ),
      ),
        ),
    );
  }

  Widget _buildInfoBox(
      String title,
      String value, {
        bool showStockArrow = false,
      }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.white70, fontSize: 12)),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (showStockArrow)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/down.png",
                          height: 14,
                          width: 14,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}