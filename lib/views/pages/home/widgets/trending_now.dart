import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test_flutter/cores/providers/data_providers/meal_data_provider.dart';

import 'package:test_flutter/views/widgets/meal_card.dart';

class TrendingNow extends StatelessWidget {
  const TrendingNow({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Trending now", style: Theme.of(context).textTheme.titleLarge),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("View all"), Icon(Icons.arrow_right)],
              ),
            ),
          ],
        ),
        Consumer(
          builder: (builder, ref, child) {
            final meals = ref.watch(mealDataProvider(""));
            return meals.when(
              data: (data) {
                if (data.isNotEmpty) {
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          final item = data[index];

                          return MealCard(item: item, ref: ref);
                        },
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("See more"), Icon(Icons.arrow_right)],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text("no data");
                }
              },
              error: (error, _) => Text(error.toString()),
              loading: () => Skeletonizer(
                enabled: true,
                child: Column(
                  spacing: 10,
                  children: List.generate(
                    3,
                    (_) => SizedBox(
                      height: 150,
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Skeleton.shade(
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("item.name"),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.favorite_outline),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "item.categorie",
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [Text("item.categorie")],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
