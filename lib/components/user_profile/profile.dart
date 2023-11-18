import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name = 'John Doe';
  final int age = 30;
  final String sex = 'Male';
  final String country = 'United States';
  final String disabilityType = 'Physical';
  final List<String> medicines = ['Medicine A', 'Medicine B', 'Medicine C'];
  final List<String> allergies = ['Allergy X', 'Allergy Y'];
  final String profileImageUrl =
      'https://example.com/profile_image.jpg'; // Replace with actual image URL

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SizedBox(height: 16.0),
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            ),
            SizedBox(height: 16.0),
            _buildProfileItem('Name', name),
            SizedBox(height: 16.0),
            _buildProfileItem('Age', age.toString()),
            SizedBox(height: 16.0),
            _buildProfileItem('Sex', sex),
            SizedBox(height: 16.0),
            _buildProfileItem('Country', country),
            SizedBox(height: 16.0),
            _buildProfileItem('Disability Type', disabilityType),
            SizedBox(height: 16.0),
            _buildListProfileItem('Medicines', medicines),
            SizedBox(height: 16.0),
            _buildListProfileItem('Allergies', allergies),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            value,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Widget _buildListProfileItem(String title, List<String> values) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: values.length,
            itemBuilder: (context, index) {
              final value = values[index];
              return Text(
                value,
                style: TextStyle(fontSize: 18.0),
              );
            },
          ),
        ],
      ),
    );
  }
}