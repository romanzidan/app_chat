class Chat {
  String? id;
  String? text;
  bool sender;
  String? avatar;

  Chat({
    required this.id,
    required this.text,
    this.sender = false,
    required this.avatar,
  });

  static List<Chat> chatList() {
    return [
      Chat(
        id: '01',
        text: 'Do we have meeting today?',
        avatar: 'assets/images/avatar2.png',
      ),
      Chat(
        id: '02',
        text: 'I don\'t know why. Just move on.',
        avatar: 'assets/images/avatar2.png',
      ),
      Chat(
        id: '03',
        text: 'who\'s birthday is it?',
        avatar: 'assets/images/avatar3.png',
        sender: true,
      ),
      Chat(
        id: '04',
        text: 'beer friday. get the snacks',
        avatar: 'assets/images/avatar2.png',
      ),
      Chat(
        id: '05',
        text: 'who brought the gifts?',
        avatar: 'assets/images/avatar2.png',
      ),
      Chat(
        id: '06',
        text: 'I am Spartacus',
        avatar: 'assets/images/avatar3.png',
      ),
    ];
  }
}
