// import 'package:flutter/material.dart';
// import 'package:graduation_project/data/api/api_manager.dart';
// import 'package:graduation_project/data/model/HomeCategories.dart';
// import 'package:graduation_project/ui/Theme/theme.dart';
// import 'package:graduation_project/ui/main_screen/main_screen.dart';
//
// class CategoryDetails extends StatefulWidget {
//   static const String routName = 'category_repository';
//   const CategoryDetails({super.key});
//
//   @override
//   State<CategoryDetails> createState() => _CategoryDetailsState();
// }
//
// class _CategoryDetailsState extends State<CategoryDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pushReplacementNamed(MainScreen.routName);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: MyTheme.blackColor,
//               size: 30,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         title: Text(
//           "Sign in",
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ),
//       body: FutureBuilder<HomeCategories>(
//         future: ApiManager.getSources(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Theme.of(context).primaryColor,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Column(
//               children: [
//                 Text("Something went wrong"),
//                 ElevatedButton(
//                     onPressed: () {
//                       ApiManager.getSources();
//                       setState(() {
//
//                       });
//                     },
//                     child: Text("Try again"))
//               ],
//             );
//           }
//           if (snapshot.data?.status != 'success') {
//             return Column(
//               children: [
//                 const Text("Something went wrong"),
//                 ElevatedButton(
//                     onPressed: () {
//                       ApiManager.getSources();
//                     },
//                     child: const Text("Try again"))
//               ],
//             );
//           }
//           var categoryList = snapshot.data?.data ?? [];
//           return ListView.builder(
//             itemBuilder: (context, index) {
//               return Text(categoryList[index].categoriesNameAr ?? '');
//             },
//             itemCount: categoryList.length,
//           );
//         },
//       ),
//     );
//   }
// }
