import 'package:hichat/widgets/glowing_action_button.dart';

import '../imports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [
    MessagesPage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pageTitle = const [
    'Messages',
    'Notifications',
    'All Calls',
    'Contacts',
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitle[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButtons(icon: Icons.search, onTap: () {}),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              title.value,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Avatar.small(
              url: Helpers.randomUrl(),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        itemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.itemSelected,
  }) : super(key: key);

  final ValueChanged<int> itemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleSelectedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.itemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(0),
      elevation: 0,
      child: SafeArea(
        bottom: true,
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 4,
            right: 4,
            top: 4,
            bottom: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _BottomNavItem(
                icon: Icons.question_answer,
                label: 'Message',
                index: 0,
                isSelected: (selectedIndex == 0),
                onTap: handleSelectedItem,
              ),
              _BottomNavItem(
                icon: Icons.call,
                label: 'Calls',
                index: 2,
                isSelected: (selectedIndex == 2),
                onTap: handleSelectedItem,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 2,
                ),
                child: GlowingActionButton(
                    iconSize: 30,
                    circleSize: 56,
                    color: AppColors.secondary,
                    icon: Icons.add,
                    onPressed: () {}),
              ),
              _BottomNavItem(
                icon: Icons.notifications,
                label: 'Notice',
                index: 1,
                isSelected: (selectedIndex == 1),
                onTap: handleSelectedItem,
              ),
              _BottomNavItem(
                icon: Icons.contacts,
                label: 'Contacts',
                index: 3,
                isSelected: (selectedIndex == 3),
                onTap: handleSelectedItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              size: isSelected ? 24 : 22,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.secondary : null,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
