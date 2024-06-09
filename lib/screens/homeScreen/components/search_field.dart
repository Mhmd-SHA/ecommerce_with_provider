import 'package:flutter/cupertino.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: SizedBox(
        height: 40,
        child: CupertinoSearchTextField(
          borderRadius: BorderRadius.circular(25),
          prefixInsets: EdgeInsets.only(left: 15, right: 10),
          placeholder: "Search ..",
          suffixIcon: Icon(
            IconlyBold.filter,
            color: CupertinoColors.darkBackgroundGray,
          ),
          suffixInsets: EdgeInsets.only(right: 15),
          suffixMode: OverlayVisibilityMode.always,
          onSuffixTap: () {},
        ),
      ),
    );
  }
}
