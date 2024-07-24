import 'package:better_do/providers/local_notifications.dart';
import 'package:better_do/providers/theme_setting.dart';
import 'package:better_do/view/settings/settings_page.dart';
import 'package:better_do/view/tags/tags_page.dart';
import 'package:better_do/view/task/task_page.dart';
import 'package:better_do/view/tasks/tasks_page.dart';
import 'package:better_do/view/todo/to_do_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(rpThemeSettingProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: theme,
      home: const MyHomePage(),
    );
  }
}

Future<dynamic> addNewTask(BuildContext context) async {
  return await showCupertinoModalPopup(
    useRootNavigator: true,
    context: context,
    builder: (context) {
      return const TaskPage();
    },
  );
}

enum HomePageTab { tasks, todo, add, tags, settings }

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    ref.read(localNotificationsServiceProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: [
          const TasksPage(),
          const ToDoPage(),
          const SizedBox(),
          const TagsPage(),
          const SettingsPage(),
        ][_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            if (value == HomePageTab.add.index) {
              addNewTask(context);
            } else {
              _selectedIndex = value;
            }
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.checkmark_square),
            label: "Tasks",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.list_number),
            label: "To do",
          ),
          NavigationDestination(
            icon: Icon(
              CupertinoIcons.add_circled,
              color: Colors.blueAccent,
            ),
            label: "",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.tag),
            label: "Tags",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}