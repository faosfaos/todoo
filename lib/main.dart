import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoo/core/di/usecase_providers.dart';
import 'package:todoo/features/task/presentation/bloc/task_bloc.dart';
import 'package:todoo/features/task/presentation/view/task_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initDependencies();
  runApp(const MyApp());
}

Future<void> _initDependencies() async {
  await UsecaseProviders.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => TaskBloc(
                fetchTasksUsecase: UsecaseProviders.fetchTasksUsecase,
                toggleTaskUsecase: UsecaseProviders.toggleTaskUsecase,
                addTaskUsecase: UsecaseProviders.addTaskUsecase,
                deleteTaskUsecase: UsecaseProviders.deleteTaskUsecase,
                updateTaskUsecase: UsecaseProviders.updateTaskUsecase,
              )..add(EventFetchTask()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: TaskView(),
      ),
    );
  }
}
