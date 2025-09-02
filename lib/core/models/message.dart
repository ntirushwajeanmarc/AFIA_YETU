class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String senderName;
  final String content;
  final MessageType type;
  final DateTime timestamp;
  final bool isRead;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.senderName,
    required this.content,
    required this.type,
    required this.timestamp,
    required this.isRead,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      senderName: json['sender_name'],
      content: json['content'],
      type: MessageType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => MessageType.text,
      ),
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['is_read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'sender_name': senderName,
      'content': content,
      'type': type.name,
      'timestamp': timestamp.toIso8601String(),
      'is_read': isRead,
    };
  }
}

enum MessageType { text, image, file, voice }
