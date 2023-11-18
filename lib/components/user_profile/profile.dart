import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name = 'Nicky Minaj';
  final int age = 30;
  final String sex = 'Male';
  final String country = 'United States';
  final String disabilityType = 'Physical';
  final List<String> medicines = ['Medicine A', 'Medicine B', 'Medicine C'];
  final List<String> allergies = ['Allergy X', 'Allergy Y'];
  final String profileImageUrl =
      'lib/components/user_profile/profile_picture.png'; // Replace with actual image file name

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // To remove the default back button
          title: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Center(
                child: Text('Profile'),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(profileImageUrl),
              ),
            ),
            const SizedBox(height: 32.0),
            _buildProfileItem('Name', name),
            const SizedBox(height: 16.0),
            _buildProfileItem('Age', age.toString()),
            const SizedBox(height: 16.0),
            _buildProfileItem('Sex', sex),
            const SizedBox(height: 16.0),
            _buildProfileItem('Country', country),
            const SizedBox(height: 16.0),
            _buildProfileItem('Disability Type', disabilityType),
            const SizedBox(height: 16.0),
            _buildListProfileItem('Medicines', medicines),
            const SizedBox(height: 16.0),
            _buildListProfileItem('Allergies', allergies),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.lightBackgroundGray,
      ),
      child: Row(
        children: [
          Text(
            '$title:',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            value,
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Widget _buildListProfileItem(String title, List<String> values) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.lightBackgroundGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: values.length,
            itemBuilder: (context, index) {
              final value = values[index];
              return Text(
                value,
                style: const TextStyle(fontSize: 18.0),
              );
            },
          ),
        ],
      ),
    );
  }
}
