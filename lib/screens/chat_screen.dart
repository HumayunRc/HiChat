import 'package:hichat/imports.dart';
import 'package:hichat/widgets/glowing_action_button.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.messageData}) : super(key: key);

  static Route route(MessageData data) {
    return MaterialPageRoute(
      builder: (context) {
        return ChatScreen(messageData: data);
      },
    );
  }

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        leadingWidth: 50,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButtons(
              icon: Icons.arrow_back,
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        title: _AppBarTitle(messageData: messageData),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 8.0),
            child: Center(
                child: IconButtonBorder(icon: Icons.add_ic_call, onTap: () {})),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: Center(
                child: IconButtonBorder(icon: Icons.video_call, onTap: () {})),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _DemoMessageList(),
          ),
          _BottomActionBar(),
        ],
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(url: messageData.pictureUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'Online',
                style: TextStyle(color: Colors.green, fontSize: 11),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          _DateLabel(label: 'Yesterday'),
          _DemoMessageOwn(
            message: 'Hi!',
            messageDate: '10:12 pm',
          ),
          _DemoMessageAi(
            message: 'Howdy howdy howdy!',
            messageDate: '10:15 pm',
          ),
          _DemoMessageOwn(
            message: 'how are you today',
            messageDate: '10:15 pm',
          ),
          _DemoMessageAi(
            message: 'How am I not myself?',
            messageDate: '10:16 pm',
          ),
          _DemoMessageOwn(
            message: 'How am I not myself?',
            messageDate: '10:16 pm',
          ),
          _DemoMessageAi(
            message: 'With a magical pencil and underpants on your head',
            messageDate: '10:17 pm',
          ),
          _DemoMessageOwn(
            message: 'You do do you?',
            messageDate: '10:17 pm',
          ),
          _DemoMessageAi(
            message:
                'Miley Cyrus: Society Wants to Shut Me Down. Not down, Miley. Up.',
            messageDate: '10:18 pm',
          ),
          _DemoMessageOwn(
            message: 'You do do you?',
            messageDate: '10:19 pm',
          ),
          _DemoMessageAi(
            message:
                'When people ask me what is more important, Potato chips or love, I dont answer because Im eating',
            messageDate: '10:20 pm',
          ),
        ],
      ),
    );
  }
}

class _DateLabel extends StatelessWidget {
  const _DateLabel({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textFaded,
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoMessageOwn extends StatelessWidget {
  const _DemoMessageOwn({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 80,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                  topLeft: Radius.circular(26),
                ),
                color: AppColors.secondary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoMessageAi extends StatelessWidget {
  const _DemoMessageAi({
    Key? key,
    required this.message,
    required this.messageDate,
  }) : super(key: key);

  final String message;
  final String messageDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 80,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
                color: Theme.of(context).cardColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 12,
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                messageDate,
                style: const TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.photo_camera),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type your message...',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 12,
              top: 8,
              bottom: 8,
            ),
            child: GlowingActionButton(
                circleSize: 50,
                color: AppColors.accent,
                icon: Icons.send,
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}
