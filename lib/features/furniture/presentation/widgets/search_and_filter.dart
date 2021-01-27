import 'package:flutter/material.dart';
import '../../../../core/presentation/widgets/gradient_container.dart';
import '../../../../core/utils/lamda_images.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.1,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        children: [
          Material(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: height * 0.062,
              width: width * 0.71,
              alignment: Alignment.center,
              child: TextField(
                style: textTheme.headline5.copyWith(fontSize: 20),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Color(0xFFC6C5CD)),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Color(0xFFC6C5CD)),
                ),
              ),
            ),
          ),
          Spacer(),
          GradientContainer(
            height: height * 0.068,
            width: height * 0.068,
            borderRadius: 16,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.all(24.0),
            
            child: ImageIcon(filterPng, color: colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
