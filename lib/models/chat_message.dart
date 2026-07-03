/// A single message in the Guest Assistant conversation.
class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.fromUser,
  });

  final String text;
  final bool fromUser;
}
