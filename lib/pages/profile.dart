import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../SubScreens/editProfile.dart';
import '../SubScreens/workoutProgress.dart';
import '../colorextension.dart';  // Assuming this file contains custom color definitions.

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  DocumentSnapshot? _userData;
  bool _isLoading = true;
  String _errorMessage = "";

  bool _notificationswitch = true;
  bool _darkswitch = false;
  String _lang = 'English';
  final List<String> _languages = ['English', 'Hindi'];

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      if (_user != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.uid)
            .get();
        if (userData.exists) {
          setState(() {
            _userData = userData;
            _isLoading = false;
          });
        } else {
          setState(() {
            _errorMessage = "User data not found.";
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Failed to load profile data.";
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black, // Dark background for the entire screen
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.01),
              _buildProfileHeader(width, height),
              SizedBox(height: height * 0.01),
              _buildStatsRow(width, height),
              SizedBox(height: height * 0.01),
              _buildAccountSection(context, width),
              SizedBox(height: height * 0.01),
              _buildOtherSection(context, width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(double width, double height) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        _userData?['name'] ?? 'User',
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
      ),
      subtitle: const Text("Weight Gainer", style: TextStyle(color: Colors.grey)),
      trailing: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[700],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  EditProfilePage()),
          );
        },
        child: const Text(
          "Edit",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildStatsRow(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatCard("Height", _userData?['height'] ?? '--'),
        _buildStatCard("Weight", _userData?['weight'] ?? '--'),
        _buildStatCard("Age", _userData?['age'] ?? '--'),
      ],
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Container(
      height: 80,
      width: 80,
      child: Card(
        color: Colors.grey[700], // Dark card background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
            Text(label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection(BuildContext context, double width) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.grey[800], // Dark card background for Account section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(title: Text("Account", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white))),
          _buildListTile(
            context,
            title: "Personal Data",
            icon: Icons.person,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfilePage())),
          ),
          _buildListTile(
            context,
            title: "Workout Progress",
            icon: Icons.insert_chart_outlined_rounded,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityTrackerPage())),
          ),
          SwitchListTile(
            title: const Text("Notification", style: TextStyle(color: Colors.white)),
            secondary: const Icon(Icons.notifications_active_outlined, color: Colors.white),
            value: _notificationswitch,
            onChanged: (value) => setState(() => _notificationswitch = value),
            activeColor: Colors.blue, // Switch active color
            inactiveThumbColor: Colors.grey, // Switch inactive color
          ),
        ],
      ),
    );
  }

  Widget _buildOtherSection(BuildContext context, double width) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.grey[800], // Dark card background for Other section
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(title: Text("Others", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white))),
          _buildListTile(
            context,
            title: "Language",
            icon: Icons.language_outlined,
            trailing: DropdownButton<String>(
              value: _lang,
              items: _languages.map((lang) => DropdownMenuItem(value: lang, child: Text(lang, style: TextStyle(color: Colors.white)))).toList(),
              onChanged: (value) => setState(() => _lang = value!),
              dropdownColor: Colors.grey[800], // Dropdown background color
              iconEnabledColor: Colors.white, // Dropdown icon color
            ),
          ),
          _buildListTile(context, title: "Plan Setting", icon: Icons.next_plan_outlined),
          _buildListTile(context, title: "Contact Us", icon: Icons.email_outlined),
          SwitchListTile(
            title: const Text("Dark Mode", style: TextStyle(color: Colors.white)),
            secondary: const Icon(Icons.dark_mode_outlined, color: Colors.white),
            value: _darkswitch,
            onChanged: (value) => setState(() => _darkswitch = value),
            activeColor: Colors.blue, // Switch active color
            inactiveThumbColor: Colors.grey, // Switch inactive color
          ),
          _buildListTile(
            context,
            title: "Logout",
            icon: Icons.logout_outlined,
            trailing: const Text("Log Out", style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {required String title, required IconData icon, Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
      onTap: onTap,
    );
  }
}
