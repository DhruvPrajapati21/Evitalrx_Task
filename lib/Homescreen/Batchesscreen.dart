import 'package:evitalrx_task/Colors.dart';
import 'package:evitalrx_task/Homescreen/UserProvider.dart';
import 'package:evitalrx_task/Homescreen/User_data.dart';
import 'package:evitalrx_task/Homescreen/Usermodel.dart';
import 'package:evitalrx_task/Homescreen/Usermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Batchesscreen extends StatefulWidget {
  const Batchesscreen({super.key});

  @override
  State<Batchesscreen> createState() => _BatchesscreenState();
}

class _BatchesscreenState extends State<Batchesscreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.setUsers(batchUsers);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        provider.loadMoreOnScroll();
      }
    });
  }

  void _showUpdateStockDialog(BuildContext context, UserModel user) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final stockController = TextEditingController(text: user.rupee.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.blue[50]!.withOpacity(0.97),
          elevation: 25,
          titlePadding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.account_circle, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 12),
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
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan.shade50, Colors.blue.shade50],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextFormField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter new amount',
                    labelText: 'New Rupee',
                    prefixIcon: const Icon(Icons.currency_rupee, color: Colors.blueAccent),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.lightBlueAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.cancel, color: AppColors.errorRed),
              label: const Text('Cancel', style: TextStyle(color: Colors.redAccent)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                int? newRupee = int.tryParse(stockController.text);
                if (newRupee == null || newRupee < 0 || newRupee > 100) {
                  Fluttertoast.showToast(
                    msg: "❌ Please enter a rupee between 0 and 100",
                    backgroundColor: AppColors.warningRed,
                    textColor: Colors.white,
                  );
                } else {
                  provider.updateUserRupee(user, newRupee);
                  Fluttertoast.showToast(
                    msg: "Rupee updated to ₹$newRupee",
                    backgroundColor: AppColors.successGreen,
                    textColor: AppColors.white,
                  );
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.check_circle_outline),
              label: const Text("Update"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
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
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Filter by name, phone, or city',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: provider.updateSearch,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: provider.displayedUsers.length + (provider.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == provider.displayedUsers.length) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final user = provider.displayedUsers[index];
                    final status = user.rupee > 50 ? 'High' : 'Low';

                    return Card(
                      margin: const EdgeInsets.all(8),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
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
                                  Text(
                                    'Rupee: ₹${user.rupee} ($status)',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit, color: Colors.green),
                                onPressed: () => _showUpdateStockDialog(context, user),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'User Record: ${index + 1}',
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
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
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
