// import 'package:flutter/material.dart';

// class search extends StatefulWidget {
//   const search({super.key});

//   @override
//   State<search> createState() => _searchState();
// }

// class _searchState extends State<search> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('widget.title'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: CustomSerarchDelegate(),
//               );
//             },
//             icon: const Icon(Icons.search,color:Colors.black ,),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomSerarchDelegate extends SearchDelegate {
//   List<"StudentModel"> searchTerms = [
//   ];
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List matchQuery = [];
//     for (var details in searchTerms) {
//       if (details.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(details);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var details in searchTerms) {
//       if (details.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(details);
//       }
//     }
//      return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }

