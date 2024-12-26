import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildFilterChips(),
            Expanded(child: _buildMessageList()),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.menu, size: 28),
              color: Colors.grey[600],
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 20),
          const Text(
            'Home',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          _buildHeaderIcon(Icons.group, 'Groups'),
          const SizedBox(width: 16),
          _buildHeaderIcon(Icons.person, 'Contacts'),
          const SizedBox(width: 16),
          _buildHeaderIcon(Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.blue[700]),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search here',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          _buildChip('All', true),
          const SizedBox(width: 12),
          _buildChip('Groups', false),
          const SizedBox(width: 12),
          _buildChip('Unread', false),
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.blue[700] : Colors.grey[600],
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: (_) {},
      backgroundColor: Colors.grey[50],
      selectedColor: Colors.blue[50],
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  Widget _buildMessageList() {
    final messages = [
      _Message('Tabish Bin Tahir', 'Hi Tabish, how are you doing?',
          '1 hour ago', false),
      _Message(
          'Anna Paul', 'Hi Tabish, how are you doing?', '1 hour ago', false),
      _Message('Tabish Bin Tahir', 'Hi Tabish, how are you doing?',
          '1 hour ago', false),
      _Message('Tabish Bin Tahir', 'Hi Tabish, how are you doing?',
          '1 hour ago', false),
      _Message('Tabish Bin Tahir', 'Hi Tabish, how are you doing?',
          '1 hour ago', false,
          hasAvatar: true),
      _Message(
          'Group name', 'Hi Tabish, how are you doing?', '1 hour ago', false,
          isGroup: true),
      _Message(
          'Group name', 'Hi Tabish, how are you doing?', '1 hour ago', false,
          isGroup: true),
    ];

    return ListView.separated(
      itemCount: messages.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final msg = messages[index];
        return Dismissible(
          key: UniqueKey(),
          background: Container(color: Colors.white),
          secondaryBackground: _buildMoreButton(context, msg),
          direction: DismissDirection.endToStart,
          dismissThresholds: const {DismissDirection.endToStart: 0.2},
          confirmDismiss: (direction) async =>
              false, // Prevents actual dismissal
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            leading: _buildAvatar(msg),
            title: Text(
              msg.sender,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              msg.isGroup ? 'Anna: ${msg.message}' : msg.message,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            trailing: Text(
              msg.time,
              style: TextStyle(
                color: Colors.blue[700],
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMoreButton(BuildContext context, _Message message) {
    return Container(
      color: Colors.white,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          // Handle More button tap
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('More options for ${message.sender}'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.more_horiz, color: Colors.white, size: 20),
              SizedBox(height: 4),
              Text(
                'More',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(_Message msg) {
    if (msg.isGroup) {
      return Stack(
        children: [
          Icon(Icons.group, color: Colors.grey[400], size: 40),
          Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey[200],
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.grey[50],
                child: Icon(Icons.person, color: Colors.grey[400], size: 12),
              ),
            ),
          ),
        ],
      );
    }

    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.grey[200],
      backgroundImage: msg.hasAvatar
          ? const NetworkImage('https://example.com/avatar.jpg')
          : null,
      child:
          !msg.hasAvatar ? Icon(Icons.person, color: Colors.grey[400]) : null,
    );
  }

  Widget _buildBottomButtons() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              minimumSize: const Size(double.infinity, 56),
            ),
            child: const Text(
              'Send new message',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 90,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue[700],
            child: const Icon(Icons.add, size: 28),
          ),
        ),
      ],
    );
  }
}

class _Message {
  final String sender;
  final String message;
  final String time;
  final bool hasMore;
  final bool isGroup;
  final bool hasAvatar;

  _Message(
    this.sender,
    this.message,
    this.time,
    this.hasMore, {
    this.isGroup = false,
    this.hasAvatar = false,
  });
}
