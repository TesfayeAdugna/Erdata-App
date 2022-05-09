// import 'package:flutter/material.dart';
// import 'package:recipe/recipe_list_screen.dart';

// void main() {
//   runApp(const RecipeApp());
// }

// class RecipeApp extends StatelessWidget {
//   const RecipeApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: RecipeListScreen(),
//     );
//   }
// }

// class DetailPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return DetailPageState();
//   }
// }

// class DetailPageState extends State {
//   int count = 5;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "You pressed the button $count times",
//               style: TextStyle(fontSize: 30),
//             ),
//             if (count % 2 == 0) Text("Even"),
//             Text(count % 2 == 0 ? "Even" : "Odd"),
//             Container(
//               width: 100,
//               height: 100,
//               color: Color(0xFFF00000),
//               child: Center(
//                 child: Text(
//                   "Hello",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(count % 2 == 0 ? Icons.add : Icons.phone),
//         onPressed: () {
//           setState(() {
//             count++;
//           });
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const profile());
}

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'profile first',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
