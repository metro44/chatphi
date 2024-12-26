import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          );
        }),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/chatphi_logo.png',
              height: 76,
              width: 146,
            ),
            const SizedBox(
              height: 20,
              width: 279.5,
            ),
            _buildSettingItem(
              title: 'Full Name',
              value: 'Tabish Bin Tahir',
              onTap: () => Navigator.pushNamed(context, '/full-name'),
            ),
            _buildSettingItem(
              title: 'Business Name',
              value: 'Mind2Matter',
              onTap: () => Navigator.pushNamed(context, '/business-name'),
            ),
            _buildSettingItem(
              title: 'Email',
              value: 'tabish@m2m.com',
              onTap: () => Navigator.pushNamed(context, '/email'),
            ),
            _buildSettingItem(
              title: 'Phone Number',
              value: '+12345678911',
              onTap: () => Navigator.pushNamed(context, '/phone-number'),
            ),
            _buildSettingItem(
              title: 'Zip Code',
              value: '10001',
              onTap: () => Navigator.pushNamed(context, '/zip-code'),
            ),
            _buildSettingItem(
              title: 'Password',
              value: '*****',
              onTap: () => Navigator.pushNamed(context, '/password'),
            ),
            _buildSettingItem(
              title: 'ID',
              value: 'Verified',
              onTap: () => Navigator.pushNamed(context, '/id'),
            ),
            _buildSettingItem(
              title: 'NPI',
              value: '',
              onTap: () => Navigator.pushNamed(context, '/npi'),
            ),
            _buildSettingItem(
              title: 'Blocklist',
              value: '',
              onTap: () => Navigator.pushNamed(context, '/blocklist'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 20,
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
