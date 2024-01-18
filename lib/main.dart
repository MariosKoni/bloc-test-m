import 'package:bloc_test_m/bloc/tabs_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const _Tabs(),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Minimal test'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.first_page),
                child: Text('First'),
              ),
              Tab(icon: Icon(Icons.face_2), child: Text('Second')),
              Tab(
                icon: Icon(Icons.last_page),
                child: Text('Third'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _FirstPage(),
            _SecondPage(),
            _ThirdPage(),
          ],
        ),
      ),
    );
  }
}

class _FirstPage extends StatefulWidget {
  const _FirstPage();

  @override
  State<_FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<_FirstPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const ViewWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class _SecondPage extends StatefulWidget {
  const _SecondPage();

  @override
  State<_SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<_SecondPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const ViewWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class _ThirdPage extends StatefulWidget {
  const _ThirdPage();

  @override
  State<_ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<_ThirdPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const ViewWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class ViewWidget extends StatelessWidget {
  const ViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabsBloc>(
      create: (context) => TabsBloc(),
      child: const _ViewWidget(),
    );
  }
}

class _ViewWidget extends StatelessWidget {
  const _ViewWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, TabsState>(builder: (context, state) {
      if (state is TabsStateError) {
        return const Center(child: _ErrorWidget());
      }

      return Center(
          child: ElevatedButton(
        onPressed: () => context.read<TabsBloc>().add(Fetch()),
        child: const Text('Spank me'),
      ));
    });
  }
}

class _ErrorWidget extends StatefulWidget {
  const _ErrorWidget();

  @override
  State<_ErrorWidget> createState() => __ErrorWidgetState();
}

class __ErrorWidgetState extends State<_ErrorWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        Scrollable.ensureVisible(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text('Oh no'),
        OutlinedButton(
          onPressed: () => context.read<TabsBloc>().add(Fetch()),
          child: const Text('Yes daddy'),
        ),
      ],
    );
  }
}

class User extends Equatable {
  const User(
      {required this.id,
      required this.userId,
      required this.title,
      required this.completed});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed']);

  final int id;
  final int userId;
  final String title;
  final bool completed;

  @override
  List<Object?> get props => [id, userId, title, completed];
}
