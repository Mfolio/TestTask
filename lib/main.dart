import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/bloc/bloc/test_bloc.dart';
import 'package:test1/model/test_modul.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TestPage());
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final TestBloc testBloc = TestBloc();

  @override
  void initState() {
    testBloc.add(GetDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data List'),
      ),
      body: dataList(),
    );
  }

  Widget dataList() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: BlocProvider(
        create: (_) => testBloc,
        child: BlocListener<TestBloc, TestState>(
          listener: (context, state) {
            if (state is TestError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<TestBloc, TestState>(
            builder: (context, state) {
              if (state is TestInitial) {
                return buildLoading();
              } else if (state is TestLoading) {
                return buildLoading();
              } else if (state is TestLoaded) {
                return buildDataList(context, state.dataModel);
              } else if (state is TestError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget buildDataList(BuildContext context, DataModel model) {
    return ListView.builder(
      key: Key('test_scroll'),
      itemCount: model.results!.length,
      itemBuilder: (context, index) {
        return ListTile(
          key: const Key('listOfCharacters'),
          onLongPress: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(model.results![index].gender.toString())));
          },
          title: Text(model.results![index].name),
          subtitle: Text(model.results![index].status.toString()),
          trailing: Container(
            height: 40,
            width: 40,
            child: ClipOval(
              child: Image.network(model.results![index].image),
            ),
          ),
        );
      },
    );
  }
}
