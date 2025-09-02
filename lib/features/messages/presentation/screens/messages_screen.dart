import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _doctors = [
    {
      'id': '1',
      'name': 'Dr. Sarah Johnson',
      'specialty': 'Cardiologist',
      'lastMessage':
          'Your test results look good. Continue with the medication.',
      'time': '2 min ago',
      'unreadCount': 2,
      'isOnline': true,
      'avatar': 'assets/doctor1.jpg',
    },
    {
      'id': '2',
      'name': 'Dr. Michael Brown',
      'specialty': 'General Physician',
      'lastMessage': 'Let\'s schedule a follow-up appointment next week.',
      'time': '1 hour ago',
      'unreadCount': 0,
      'isOnline': false,
      'avatar': 'assets/doctor2.jpg',
    },
    {
      'id': '3',
      'name': 'Dr. Emily Davis',
      'specialty': 'Dermatologist',
      'lastMessage': 'Apply the cream twice daily and let me know how it goes.',
      'time': '3 hours ago',
      'unreadCount': 1,
      'isOnline': true,
      'avatar': 'assets/doctor3.jpg',
    },
  ];

  final List<Map<String, dynamic>> _supportChats = [
    {
      'id': 'support1',
      'name': 'Customer Support',
      'lastMessage': 'How can we help you today?',
      'time': '5 min ago',
      'unreadCount': 0,
      'isOnline': true,
      'avatar': 'assets/support.jpg',
    },
    {
      'id': 'pharmacy1',
      'name': 'Pharmacy Support',
      'lastMessage': 'Your medication order has been processed.',
      'time': '1 day ago',
      'unreadCount': 0,
      'isOnline': false,
      'avatar': 'assets/pharmacy.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Doctors'),
            Tab(text: 'Support'),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildDoctorChats(), _buildSupportChats()],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewChatDialog(context);
        },
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() {}),
        decoration: InputDecoration(
          hintText: 'Search conversations...',
          filled: true,
          fillColor: Colors.grey[100],
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorChats() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _doctors.length,
      itemBuilder: (context, index) {
        final doctor = _doctors[index];
        return _buildChatTile(doctor, true);
      },
    );
  }

  Widget _buildSupportChats() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _supportChats.length,
      itemBuilder: (context, index) {
        final chat = _supportChats[index];
        return _buildChatTile(chat, false);
      },
    );
  }

  Widget _buildChatTile(Map<String, dynamic> chat, bool isDoctor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFF2196F3),
              child: Icon(
                isDoctor ? Icons.medical_services : Icons.support_agent,
                color: Colors.white,
                size: 25,
              ),
            ),
            if (chat['isOnline'])
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                chat['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              chat['time'],
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isDoctor) ...[
              Text(
                chat['specialty'],
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
            ],
            Row(
              children: [
                Expanded(
                  child: Text(
                    chat['lastMessage'],
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (chat['unreadCount'] > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2196F3),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      chat['unreadCount'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        onTap: () {
          _openChatRoom(context, chat, isDoctor);
        },
      ),
    );
  }

  void _openChatRoom(
    BuildContext context,
    Map<String, dynamic> chat,
    bool isDoctor,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatRoomScreen(
          chatId: chat['id'],
          chatName: chat['name'],
          isDoctor: isDoctor,
          specialty: isDoctor ? chat['specialty'] : null,
        ),
      ),
    );
  }

  void _showNewChatDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Start New Chat'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.medical_services, color: Color(0xFF2196F3)),
                title: Text('Find a Doctor'),
                subtitle: Text('Search and chat with available doctors'),
              ),
              ListTile(
                leading: Icon(Icons.support_agent, color: Color(0xFF2196F3)),
                title: Text('Customer Support'),
                subtitle: Text('Get help with your account or orders'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class ChatRoomScreen extends StatefulWidget {
  final String chatId;
  final String chatName;
  final bool isDoctor;
  final String? specialty;

  const ChatRoomScreen({
    super.key,
    required this.chatId,
    required this.chatName,
    required this.isDoctor,
    this.specialty,
  });

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {
      'id': '1',
      'content': 'Hello! How can I help you today?',
      'senderId': 'doctor',
      'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
      'type': 'text',
      'isMe': false,
    },
    {
      'id': '2',
      'content': 'Hi Doctor, I\'ve been experiencing some chest pain recently.',
      'senderId': 'patient',
      'timestamp': DateTime.now().subtract(
        const Duration(hours: 1, minutes: 50),
      ),
      'type': 'text',
      'isMe': true,
    },
    {
      'id': '3',
      'content':
          'I understand your concern. Can you describe the pain? Is it sharp or dull?',
      'senderId': 'doctor',
      'timestamp': DateTime.now().subtract(
        const Duration(hours: 1, minutes: 45),
      ),
      'type': 'text',
      'isMe': false,
    },
    {
      'id': '4',
      'content': 'It\'s more of a dull ache, especially when I exercise.',
      'senderId': 'patient',
      'timestamp': DateTime.now().subtract(
        const Duration(hours: 1, minutes: 40),
      ),
      'type': 'text',
      'isMe': true,
    },
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatName, style: const TextStyle(fontSize: 16)),
            if (widget.specialty != null)
              Text(
                widget.specialty!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              _startVideoCall(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              _startVoiceCall(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showChatOptions(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isMe = message['isMe'];
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF2196F3) : Colors.grey[200],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message['content'],
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black87,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file),
            onPressed: () {
              _showAttachmentOptions(context);
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              maxLines: null,
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: const Color(0xFF2196F3),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                _sendMessage();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'id': DateTime.now().millisecondsSinceEpoch.toString(),
          'content': _messageController.text.trim(),
          'senderId': 'patient',
          'timestamp': DateTime.now(),
          'type': 'text',
          'isMe': true,
        });
      });
      _messageController.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _startVideoCall(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Start Video Call'),
          content: Text('Starting video call with ${widget.chatName}...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement video call functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Video call feature coming soon!'),
                  ),
                );
              },
              child: const Text('Call'),
            ),
          ],
        );
      },
    );
  }

  void _startVoiceCall(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Start Voice Call'),
          content: Text('Starting voice call with ${widget.chatName}...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implement voice call functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Voice call feature coming soon!'),
                  ),
                );
              },
              child: const Text('Call'),
            ),
          ],
        );
      },
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Send Attachment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentOption(Icons.camera_alt, 'Camera', () {
                  Navigator.pop(context);
                  // TODO: Implement camera functionality
                }),
                _buildAttachmentOption(Icons.photo_library, 'Gallery', () {
                  Navigator.pop(context);
                  // TODO: Implement gallery functionality
                }),
                _buildAttachmentOption(Icons.insert_drive_file, 'Document', () {
                  Navigator.pop(context);
                  // TODO: Implement document picker
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentOption(
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFF2196F3),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  void _showChatOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Chat Info'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.block),
              title: const Text('Block Contact'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('Report'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
