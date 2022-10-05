// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:test1/main.dart';
// import 'package:nock/nock.dart';
// import 'dart:convert';

// void main() {

//  setUp(() {
//     nock.cleanAll();
//   });


//   testWidgets('fetch caracters',(WidgetTester tester)async{

//       final testListTile = find.byKey(ValueKey('listOfCharacters'));
//       final scrolTestListView = find.byKey(ValueKey('test_scroll'));

//       await tester.pumpWidget(MaterialApp(home: TestPage(),));
//       await tester.scrollUntilVisible(scrolTestListView, 100);
//       await tester.longPress(testListTile);
//       await tester.pump();

//       expect(find.text('text'));

//   });
// }