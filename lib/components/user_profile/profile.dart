import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name = 'Tin Hei';
  final int age = 24;
  final String sex = 'Male';
  final String country = 'Hong Kong';
  final List<String> disabilityType = ['Asthma', 'Broken Leg', 'Visual Impairment'];
  final List<String> tools = ['Wheelchair', 'Service Dog'];
  final List<String> medicines = ['Oxygen Mask'];
  final List<String> allergies = ['Seafood'];
  final String profileImageUrl = 'lib/components/user_profile/profile_picture.png'; // Replace with actual image file name

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
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: Text('Profile'),
              ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SizedBox(height: 16.0),
            Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(profileImageUrl),
              ),
            ),
            SizedBox(height: 32.0),
            _buildProfileItem('Name', name),
            SizedBox(height: 16.0),
            _buildProfileItem('Age', age.toString()),
            SizedBox(height: 16.0),
            _buildProfileItem('Sex', sex),
            SizedBox(height: 16.0),
            _buildProfileItem('Country', country),
            SizedBox(height: 16.0),
            _buildListProfileItem('Disability Type', disabilityType),
            SizedBox(height: 16.0),
            _buildListProfileItem('Tools', tools),
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
        color: CupertinoColors.systemBlue,
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
        color: CupertinoColors.systemBlue,
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