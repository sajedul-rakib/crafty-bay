import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchInputTextFormField extends StatelessWidget {
  const SearchInputTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {},
      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
          hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade500),
          hintText: "Search",
          fillColor: Colors.grey.shade300,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
