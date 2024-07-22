import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;
  final Function(String query) search;

  const SearchField(
      {super.key,
      required this.searchController,
      required this.hintText,
      required this.search});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
          hintText: hintText, contentPadding: const EdgeInsets.all(12)),
      onChanged: (query) {
        search(query);
      },
      keyboardType: TextInputType.text,
    );
  }
}
