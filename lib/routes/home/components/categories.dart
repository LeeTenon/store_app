import 'package:flutter/material.dart';
import 'package:my_flutter/mocks/categories.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: demo_categories.length,
      itemBuilder: (context, index) => CategoryCard(
        icon: demo_categories[index].icon,
        title: demo_categories[index].title,
        press: () {},
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 20),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
