import 'package:evitalrx_task/Homescreen/Usermodel.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  late List<UserModel> _allUsers;
  final List<UserModel> _displayedUsers = [];
  final int _recordsPerPage = 20;
  int _currentPage = 0;
  bool _isLoading = false;
  String _searchQuery = '';

  void setUsers(List<UserModel> users) {
    _allUsers = List.from(users);
    _displayedUsers.clear();
    _currentPage = 0;
    _loadMoreRecords();
    notifyListeners();
  }

  List<UserModel> get displayedUsers => _displayedUsers;
  bool get isLoading => _isLoading;

  void _loadMoreRecords() {
    if (_isLoading || _currentPage * _recordsPerPage >= _allUsers.length) return;
    _isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 600), () {
      final next = _allUsers
          .skip(_currentPage * _recordsPerPage)
          .take(_recordsPerPage)
          .toList();
      _displayedUsers.addAll(next);
      _currentPage++;
      _isLoading = false;
      notifyListeners();
    });
  }

  void updateSearch(String query) {
    _searchQuery = query;
    _filterUsers();
  }

  void _filterUsers() {
    final filtered = _allUsers.where((user) {
      final q = _searchQuery.toLowerCase();
      return user.name.toLowerCase().contains(q) ||
          user.phone.toLowerCase().contains(q) ||
          user.city.toLowerCase().contains(q);
    }).toList();

    _displayedUsers
      ..clear()
      ..addAll(filtered.take(_recordsPerPage));
    _currentPage = 1;
    notifyListeners();
  }

  void updateUserRupee(UserModel user, int rupee) {
    user.rupee = rupee;
    notifyListeners();
  }

  void loadMoreOnScroll() => _loadMoreRecords();
}
